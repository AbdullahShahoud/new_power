import 'package:freezed_annotation/freezed_annotation.dart';
import '../../data/models/stored_file.dart';

part 'file_upload_state.freezed.dart';

/// §8.1 `Idle → Uploading(progress) → Uploaded(StoredFileView) ↘ Failed` /
/// `Idle → Resolving → Resolved ↘ ResolveFailed`. `Cancelled` is reachable
/// from `Uploading` only (removing a photo from the picker mid-upload).
enum FileUploadItemStatus { uploading, uploaded, failed, cancelled }

enum FileUploadFailureReason { tooLarge, network, rejected }

@freezed
sealed class FileUploadItem with _$FileUploadItem {
  const factory FileUploadItem({
    required String localId,
    required FileUploadItemStatus status,
    @Default(0.0) double progress,
    StoredFileView? file,
    FileUploadFailureReason? failureReason,
    String? errorMessage,
  }) = _FileUploadItem;
}

enum FileResolveStatus { resolving, resolved, failed }

@freezed
sealed class FileResolveItem with _$FileResolveItem {
  const factory FileResolveItem({
    required String key,
    required FileResolveStatus status,
    StoredFileView? file,
    String? errorMessage,
  }) = _FileResolveItem;
}

/// One [FileUploadItem] per in-flight/completed upload, keyed by `localId`,
/// so a screen with several pickers (register-project's photo grid) renders
/// N independent progress rows off a single Bloc instance. `resolves` is
/// the same idea for `POST /files/resolve` calls, keyed by `key`.
@freezed
sealed class FileUploadState with _$FileUploadState {
  const factory FileUploadState({
    @Default(<String, FileUploadItem>{}) Map<String, FileUploadItem> uploads,
    @Default(<String, FileResolveItem>{}) Map<String, FileResolveItem> resolves,
  }) = _FileUploadState;
}
