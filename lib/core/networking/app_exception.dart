/// Custom exception class for all application errors
/// This serves as a unified exception model across the app
/// and provides clear separation of concerns
sealed class AppException implements Exception {
  final String message;
  final String? code;
  final int? statusCode;
  final dynamic originalError;
  final StackTrace? stackTrace;

  AppException({
    required this.message,
    this.code,
    this.statusCode,
    this.originalError,
    this.stackTrace,
  });

  @override
  String toString() => message;
}

/// Network-related exceptions (timeouts, connection errors, etc.)
final class NetworkException extends AppException {
  NetworkException({
    required super.message,
    super.code,
    super.originalError,
    super.stackTrace,
  });
}

/// Server returned an error response (bad status code)
final class ServerException extends AppException {
  /// Raw response body from server (for debugging)
  final Map<String, dynamic>? rawResponse;

  ServerException({
    required super.message,
    super.code,
    required super.statusCode,
    super.originalError,
    super.stackTrace,
    this.rawResponse,
  });
}

/// Validation error from the server or local validation
final class ValidationException extends AppException {
  /// Field-level validation errors
  final Map<String, List<String>>? fieldErrors;

  ValidationException({
    required super.message,
    super.code,
    super.originalError,
    super.stackTrace,
    this.fieldErrors,
  });
}

/// Authentication/Authorization errors
final class AuthenticationException extends AppException {
  /// Whether the session has expired
  final bool isSessionExpired;

  AuthenticationException({
    required super.message,
    super.code,
    super.statusCode,
    super.originalError,
    super.stackTrace,
    this.isSessionExpired = false,
  });
}

/// Rate limiting exception
final class RateLimitException extends AppException {
  /// Seconds to wait before retrying
  final int? retryAfterSeconds;

  RateLimitException({
    required super.message,
    super.code,
    required super.statusCode,
    super.originalError,
    super.stackTrace,
    this.retryAfterSeconds,
  });
}

/// Unknown or unexpected error
final class UnknownException extends AppException {
  UnknownException({
    required super.message,
    super.code,
    super.originalError,
    super.stackTrace,
  });
}
