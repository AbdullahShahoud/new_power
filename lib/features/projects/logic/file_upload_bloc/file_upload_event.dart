import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_upload_event.freezed.dart';

@freezed
sealed class FileUploadEvent with _$FileUploadEvent {
  /// [localId] is caller-generated (e.g. `Uuid().v4()`) before the upload
  /// starts, so the UI has a stable key to render a progress row against
  /// even before the server has assigned anything. One `FileUploadBloc`
  /// instance can back several pickers on the same screen — rows are
  /// segregated by `localId`, not by any server concept (`POST /files`
  /// takes only the multipart file itself, §10 Workflow 1).
  const factory FileUploadEvent.uploadRequested({
    required String localId,
    required File file,
  }) = FileUploadRequested;

  const factory FileUploadEvent.uploadCancelled({required String localId}) =
      FileUploadCancelled;

  const factory FileUploadEvent.resolveRequested({required String key}) =
      FileResolveRequested;
}
