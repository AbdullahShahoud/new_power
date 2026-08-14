import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../models/file_response.dart';
import '../models/resolve_file_request.dart';
import '../models/stored_file.dart';

/// Workflow 1 (§10) — one file per call, never batched. Every photo and
/// attachment in the module is a `key` handed back from here.
class FileRepository {
  final Dio _dio;
  final ApiService _apiService;

  /// [dio] must be the same interceptor-wired instance [apiService] uses
  /// (`DioFactory.getAppDio()`) — see the note in `api_service.dart` on why
  /// `uploadFile` isn't a Retrofit method.
  FileRepository(this._dio, this._apiService);

  /// `POST /files`, multipart, field name "file". [onSendProgress] reports
  /// `0..1` — real bytes-sent progress, not a simulated value, matching the
  /// `Uploading(progress)` state in projects-implementation-map.md §8.1.
  /// A 413 (oversized) surfaces as `ApiErrorModel.statusCode == 413`; the
  /// caller (`FileUploadBloc`) maps that to `FileUploadFailureReason.tooLarge`.
  Future<ApiResult<StoredFileView>> uploadFile(
    File file, {
    void Function(double progress)? onSendProgress,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: file.uri.pathSegments.last,
        ),
      });
      final response = await _dio.post<Map<String, dynamic>>(
        ApiConstants.uploadFile,
        data: formData,
        // `DioFactory._configureCommon` sets a fixed `Content-Type:
        // application/json` base header on this shared instance. Dio does
        // not replace an already-present Content-Type header with the
        // correct `multipart/form-data; boundary=...` just because `data`
        // is `FormData` — it has to be forced per-request, or the server
        // never parses a file out of the body at all (surfaces server-side
        // as if no file were sent, per the note in `file_repository.dart`).
        options: Options(contentType: 'multipart/form-data'),
        onSendProgress: (sent, total) {
          if (total > 0) onSendProgress?.call(sent / total);
        },
      );
      final parsed = FileResponse.fromJson(response.data!);
      return ApiResult.success(parsed.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  /// `POST /files/resolve` — exchange an expired/`null` `url` for a fresh
  /// one. `key` never expires.
  Future<ApiResult<StoredFileView>> resolveFile(String key) async {
    try {
      final request = ResolveFileRequest(key: key);
      request.validate();
      final response = await _apiService.resolveFile(request);
      return ApiResult.success(response.data);
    } on ArgumentError catch (e) {
      return ApiResult.failure(
        ApiErrorModel(
          message: e.message ?? 'Validation failed',
          code: 'VALIDATION_ERROR',
        ),
      );
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
