import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';
import 'api_error_model.dart';

/// API Error Handler - Processes API errors and returns error codes
/// Error codes are then translated using localization in the UI layer
/// SECURITY: Sanitizes error messages to prevent information disclosure
class ApiErrorHandler {
  /// Handle any error and return ApiErrorModel with error code
  /// The error code can be translated using getLocalizedMessage()
  /// SECURITY: Returns generic messages instead of exposing error details
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else {
      return ApiErrorModel(
        message: 'An unexpected error occurred',
        code: 'UNEXPECTED_ERROR',
      );
    }
  }

  /// Handle DioException errors with proper message sanitization
  /// SECURITY: Never expose stack traces or sensitive API details
  static ApiErrorModel _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiErrorModel(
          message: 'Connection timeout. Please check your internet and try again.',
          code: 'CONNECTION_TIMEOUT',
        );
      case DioExceptionType.sendTimeout:
        return ApiErrorModel(
          message: 'Request took too long. Please try again.',
          code: 'SEND_TIMEOUT',
        );
      case DioExceptionType.receiveTimeout:
        return ApiErrorModel(
          message: 'Server response took too long. Please try again.',
          code: 'RECEIVE_TIMEOUT',
        );
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode ?? 0;

        // SECURITY: Don't expose 5xx details to user
        if (statusCode >= 500) {
          return ApiErrorModel(
            message: 'Service temporarily unavailable. Please try again later.',
            code: 'SERVER_ERROR',
            statusCode: statusCode,
          );
        }

        // For other responses, sanitize the message
        final errorModel = _handleError(error.response?.data);
        // 429: prefer the standard `Retry-After` response header — auth.md's
        // per-endpoint throttles don't guarantee `error.details.retryAfter`
        // is present (details are stripped outside development), but a
        // compliant 429 response should always carry the header.
        int? retryAfter = errorModel.retryAfter;
        if (statusCode == 429) {
          final headerValue = error.response?.headers.value('Retry-After');
          retryAfter = int.tryParse(headerValue ?? '') ?? retryAfter;
        }
        return ApiErrorModel(
          message: errorModel.message,
          code: errorModel.code,
          errors: errorModel.errors,
          retryAfter: retryAfter,
          statusCode: statusCode,
        );
      case DioExceptionType.cancel:
        return ApiErrorModel(
          message: 'Request was cancelled',
          code: 'REQUEST_CANCELLED',
        );
      case DioExceptionType.connectionError:
        return ApiErrorModel(
          message: 'No internet connection. Please check your network.',
          code: 'NO_INTERNET',
        );
      case DioExceptionType.unknown:
        return ApiErrorModel(
          message: 'An unexpected error occurred',
          code: 'UNKNOWN_ERROR',
        );
      default:
        return ApiErrorModel(
          message: 'An unexpected error occurred',
          code: 'UNEXPECTED_ERROR',
        );
    }
  }

  /// Handle error response from API
  /// Actual API format: { success, message, error: { code, statusCode }, meta }
  /// SECURITY: Sanitize all messages before returning to UI
  static ApiErrorModel _handleError(dynamic data) {
    try {
      if (data is Map<String, dynamic>) {
        // Extract error code from error object (safe to expose)
        String code = 'UNKNOWN_ERROR';
        int? retryAfter;
        if (data['error'] is Map<String, dynamic>) {
          final errorData = data['error'] as Map<String, dynamic>;
          code = errorData['code']?.toString() ?? 'UNKNOWN_ERROR';
          // Extract retryAfter from details (e.g. 429 rate limit)
          if (errorData['details'] is Map<String, dynamic>) {
            final details = errorData['details'] as Map<String, dynamic>;
            retryAfter = details['retryAfter'] as int?;
          }
        }

        // Extract and sanitize message (can be string or array)
        final rawMessage = data['message'] ?? 'Unknown error';
        final message = _sanitizeMessage(
          rawMessage is List ? rawMessage.join(', ') : rawMessage.toString(),
        );

        return ApiErrorModel(
          message: message,
          code: code,
          retryAfter: retryAfter,
        );
      }

      // Fallback - sanitize any message
      return ApiErrorModel(
        message: _sanitizeMessage(data?.toString() ?? 'Unknown error'),
        code: 'UNKNOWN_ERROR',
      );
    } catch (e) {
      return ApiErrorModel(
        message: 'An error occurred',
        code: 'PARSE_ERROR',
      );
    }
  }

  /// Sanitize error messages to prevent information disclosure
  /// SECURITY: Remove file paths, SQL details, stack traces, credentials, etc.
  static String _sanitizeMessage(String message) {
    String sanitized = message;

    // Mask passwords
    sanitized = sanitized.replaceAllMapped(
      RegExp(r'(password|pwd)\s*[=:]\s*[^\s,}]+', caseSensitive: false),
      (match) => '${match.group(1)}: "***MASKED***"',
    );

    /// Mask PIN codes
    /// We ensured that PIN values are detected and masked regardless of how they are
    /// formatted in the response.
    sanitized = sanitized.replaceAllMapped(
      RegExp(r'(pin)\s*[=:]\s*[^\s,}]+', caseSensitive: false),
      (match) => '${match.group(1)}: "***MASKED***"',
    );

    /// Mask tokens
    /// We added protection to mask any token values to prevent accidental exposure in logs or UI.
    sanitized = sanitized.replaceAllMapped(
      RegExp(r'(token)\s*[=:]\s*[^\s,}]+', caseSensitive: false),
      (match) => '${match.group(1)}: "***MASKED***"',
    );

    // Mask authorization headers
    sanitized = sanitized.replaceAll(
      RegExp(r'Authorization"?\s*:\s*"Bearer\s+[^\s"]*"?', caseSensitive: false),
      'Authorization: Bearer ***MASKED***',
    );

    // Mask device IDs
    sanitized = sanitized.replaceAll(
      RegExp(r'"deviceId"\s*:\s*"[^"]*"', caseSensitive: false),
      '"deviceId":"***MASKED***"',
    );

    // Remove file paths (Windows and Unix)
    sanitized = sanitized.replaceAll(
      RegExp(r'(\/[a-zA-Z0-9_\-\.\/]+|[A-Za-z]:\\[a-zA-Z0-9_\-\.\\\s]+)'),
      '[path]',
    );

    // Remove SQL keywords and potential SQL injection attempts
    sanitized = sanitized.replaceAll(
      RegExp(
        r'\b(SELECT|FROM|WHERE|INSERT|DELETE|UPDATE|DROP|TABLE|CREATE|ALTER|EXEC|EXECUTE)\b',
        caseSensitive: false,
      ),
      '[sql]',
    );

    // Remove error codes like [Errno 2], [Error 404], etc.
    sanitized = sanitized.replaceAll(RegExp(r'\[\w+\s+\d+\]'), '[error]');

    // Remove stack traces (common patterns)
    sanitized = sanitized.replaceAll(
      RegExp(r'(at\s+\w+\s+\(|throw\s+\w+\s*\(|Exception:)'),
      '[trace]',
    );

    // Limit length to prevent message injection and excessive output
    if (sanitized.length > 150) {
      sanitized = '${sanitized.substring(0, 150)}...';
    }

    return sanitized;
  }

  /// Get localized error message based on error code
  /// This should be called in the UI layer where BuildContext is available
  static String getLocalizedMessage(BuildContext context, String errorCode) {
    final errorKey = _getErrorKeyFromCode(errorCode);
    return context.tr(errorKey);
  }

  /// Map error codes to localization keys. Scoped to the codes documented
  /// in auth.md / README1.md — codes from unbuilt features (wallet, QR,
  /// KYC, ...) are intentionally not pre-declared here.
  static String _getErrorKeyFromCode(String code) {
    switch (code.toUpperCase()) {
      // Network errors (client-side, from DioExceptionType)
      case 'CONNECTION_TIMEOUT':
        return 'error_connection_timeout';
      case 'SEND_TIMEOUT':
        return 'error_send_timeout';
      case 'RECEIVE_TIMEOUT':
        return 'error_receive_timeout';
      case 'REQUEST_CANCELLED':
        return 'error_request_cancelled';
      case 'NO_INTERNET':
        return 'error_no_internet';
      case 'PARSE_ERROR':
        return 'error_parse';
      case 'SERVER_ERROR':
        return 'error_server_unavailable';

      // Validation (400)
      case 'VALIDATION_ERROR':
      case 'HTTP_EXCEPTION':
        return 'error_validation';
      case 'AUTH_INVALID_MANAGER_CODE':
        return 'error_invalid_manager_code';
      case 'AUTH_INVALID_RESET_CODE':
      case 'VERIFICATION_INVALID_CODE':
        return 'error_invalid_reset_code';

      // Authentication (401)
      case 'AUTH_INVALID_CREDENTIALS':
        return 'error_invalid_credentials';
      case 'AUTH_TOKEN_NOT_FOUND':
      case 'AUTH_TOKEN_REVOKED':
        return 'error_token_revoked';
      case 'AUTH_INVALID_TOKEN_TYPE':
      case 'AUTH_INVALID_REFRESH_TOKEN':
        return 'error_token_reuse_detected';
      case 'AUTH_REFRESH_TOKEN_NOT_PROVIDED':
        return 'error_invalid_token';
      case 'DEVICE_ID_MISMATCH':
        return 'error_device_id_mismatch';
      case 'AUTH_USER_NOT_FOUND':
      case 'AUTH_USER_NOT_ACTIVE':
        return 'error_invalid_credentials';

      // Account status (403, dev/staging only — production maps these to
      // AUTH_INVALID_CREDENTIALS above, per auth.md §8 anti-enumeration)
      case 'AUTH_ACCOUNT_BANNED':
        return 'error_account_banned';
      case 'AUTH_ACCOUNT_SUSPENDED':
        return 'error_account_suspended';
      case 'AUTH_ACCOUNT_LOCKED':
        return 'error_account_locked';
      case 'FORBIDDEN':
        return 'error_forbidden';

      // Conflict (409)
      case 'AUTH_PHONE_ALREADY_EXISTS':
        return 'error_duplicate_phone';
      case 'AUTH_EMAIL_ALREADY_EXISTS':
        return 'error_duplicate_email';
      case 'CONFLICT':
        return 'error_duplicate_request';

      // Device (400)
      case 'DEVICE_MAX_DEVICES_REACHED':
        return 'error_max_devices_reached';

      // Rate limiting (429)
      case 'RATE_LIMIT_EXCEEDED':
        return 'error_too_many_requests';

      // Default
      case 'UNKNOWN_ERROR':
      case 'UNEXPECTED_ERROR':
      default:
        return 'error_unexpected';
    }
  }
}

/// Extension to easily get localized error messages from ApiErrorModel
extension ApiErrorModelExtension on ApiErrorModel {
  /// Get localized error message
  String getLocalizedMessage(BuildContext context) {
    return ApiErrorHandler.getLocalizedMessage(
      context,
      code ?? 'UNKNOWN_ERROR',
    );
  }
}
