import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/api_result.dart';
import '../../data/repo/file_repository.dart';
import 'file_upload_event.dart';
import 'file_upload_state.dart';

/// Backs every file picker in the module (register-project photos, activity
/// attachments). Bloc's default event transformer runs handlers
/// concurrently, which is what N-independent-progress-rows needs: picking
/// five photos fires five `FileUploadRequested` events that upload and
/// report progress in parallel, not queued one after another.
class FileUploadBloc extends Bloc<FileUploadEvent, FileUploadState> {
  final FileRepository _fileRepository;

  FileUploadBloc(this._fileRepository) : super(const FileUploadState()) {
    on<FileUploadRequested>(_onUploadRequested);
    on<FileUploadCancelled>(_onUploadCancelled);
    on<FileResolveRequested>(_onResolveRequested);
  }

  Future<void> _onUploadRequested(
    FileUploadRequested event,
    Emitter<FileUploadState> emit,
  ) async {
    emit(
      state.copyWith(
        uploads: {
          ...state.uploads,
          event.localId: FileUploadItem(
            localId: event.localId,
            status: FileUploadItemStatus.uploading,
          ),
        },
      ),
    );

    final result = await _fileRepository.uploadFile(
      event.file,
      onSendProgress: (progress) {
        // A cancelled upload's handler is still running (the HTTP request
        // itself isn't aborted, only its result is ignored) — don't
        // resurrect a row the user already dismissed.
        final current = state.uploads[event.localId];
        if (current == null ||
            current.status != FileUploadItemStatus.uploading) {
          return;
        }
        emit(
          state.copyWith(
            uploads: {
              ...state.uploads,
              event.localId: current.copyWith(progress: progress),
            },
          ),
        );
      },
    );

    final current = state.uploads[event.localId];
    if (current == null || current.status != FileUploadItemStatus.uploading) {
      return; // cancelled while the request was in flight
    }

    switch (result) {
      case Success(data: final file):
        emit(
          state.copyWith(
            uploads: {
              ...state.uploads,
              event.localId: current.copyWith(
                status: FileUploadItemStatus.uploaded,
                progress: 1,
                file: file,
              ),
            },
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            uploads: {
              ...state.uploads,
              event.localId: current.copyWith(
                status: FileUploadItemStatus.failed,
                failureReason: _failureReasonOf(error),
                errorMessage: error.message,
              ),
            },
          ),
        );
    }
  }

  FileUploadFailureReason _failureReasonOf(ApiErrorModel error) {
    if (error.statusCode == 413) return FileUploadFailureReason.tooLarge;
    if (error.code == 'NO_INTERNET' ||
        error.code == 'CONNECTION_TIMEOUT' ||
        error.code == 'SEND_TIMEOUT') {
      return FileUploadFailureReason.network;
    }
    return FileUploadFailureReason.rejected;
  }

  void _onUploadCancelled(
    FileUploadCancelled event,
    Emitter<FileUploadState> emit,
  ) {
    final uploads = {...state.uploads};
    final current = uploads[event.localId];
    if (current == null) return;
    uploads[event.localId] = current.copyWith(
      status: FileUploadItemStatus.cancelled,
    );
    emit(state.copyWith(uploads: uploads));
  }

  Future<void> _onResolveRequested(
    FileResolveRequested event,
    Emitter<FileUploadState> emit,
  ) async {
    emit(
      state.copyWith(
        resolves: {
          ...state.resolves,
          event.key: FileResolveItem(
            key: event.key,
            status: FileResolveStatus.resolving,
          ),
        },
      ),
    );

    final result = await _fileRepository.resolveFile(event.key);

    switch (result) {
      case Success(data: final file):
        emit(
          state.copyWith(
            resolves: {
              ...state.resolves,
              event.key: FileResolveItem(
                key: event.key,
                status: FileResolveStatus.resolved,
                file: file,
              ),
            },
          ),
        );
      case Failure(error: final error):
        emit(
          state.copyWith(
            resolves: {
              ...state.resolves,
              event.key: FileResolveItem(
                key: event.key,
                status: FileResolveStatus.failed,
                errorMessage: error.message,
              ),
            },
          ),
        );
    }
  }
}
