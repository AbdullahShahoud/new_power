import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/widget/image_viewer_screen.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../logic/file_upload_bloc/file_upload_bloc.dart';
import '../../logic/file_upload_bloc/file_upload_event.dart';
import '../../logic/file_upload_bloc/file_upload_state.dart';

/// Shared photo picker grid — thumbnails with an upload-progress overlay, a
/// remove badge, and an "add" tile, backed by `FileUploadBloc`. Used by
/// `register_project_screen.dart` (project photos, `ProjectFileRefDto`) and
/// `log_activity_screen.dart` (activity attachments, `UploadedFileDto`) —
/// both just need "pick photos, show upload state, let me remove one
/// before I submit," so the grid itself doesn't care which DTO the caller
/// eventually builds from the finished uploads.
class PhotoUploadGrid extends StatelessWidget {
  final List<String> localIds;
  final Map<String, File> pickedFiles;
  final int maxPhotos;
  final VoidCallback onAdd;
  final ValueChanged<String> onRemove;

  const PhotoUploadGrid({
    super.key,
    required this.localIds,
    required this.pickedFiles,
    required this.onAdd,
    required this.onRemove,
    this.maxPhotos = 10,
  });

  /// Full-screen viewer over the photos picked so far, opening at the
  /// tapped one. Only ids with a real local file are included.
  void _openViewer(BuildContext context, String tappedLocalId) {
    final withFiles = localIds
        .where((id) => pickedFiles[id] != null)
        .toList();
    final startIndex = withFiles.indexOf(tappedLocalId);
    if (withFiles.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ImageViewerScreen(
          images: [
            for (final id in withFiles) ViewableImage.file(pickedFiles[id]!),
          ],
          initialIndex: startIndex < 0 ? 0 : startIndex,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocBuilder<FileUploadBloc, FileUploadState>(
      builder: (context, uploadState) {
        return Wrap(
          spacing: 10.w,
          runSpacing: 10.h,
          children: [
            for (final localId in localIds)
              _PhotoTile(
                file: pickedFiles[localId],
                item: uploadState.uploads[localId],
                onRemove: () => onRemove(localId),
                // Lets the rep check a photo full-size before submitting —
                // on a phone thumbnail it's hard to tell a usable shot from
                // a blurred one.
                onTap: () => _openViewer(context, localId),
                // Re-dispatching `uploadRequested` for the same localId is
                // the retry: the Bloc resets that entry to `uploading` and
                // starts the request again, so the tile picks the new state
                // up with no extra plumbing. The file is still on disk —
                // nothing about a failed upload consumed it.
                onRetry: () {
                  final file = pickedFiles[localId];
                  if (file == null) return;
                  context.read<FileUploadBloc>().add(
                    FileUploadEvent.uploadRequested(
                      localId: localId,
                      file: file,
                    ),
                  );
                },
              ),
            if (localIds.length < maxPhotos)
              PressableScale(
                onTap: onAdd,
                child: Container(
                  width: 76.w,
                  height: 76.w,
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(AppRadius.field),
                    border: Border.all(color: colors.ink200),
                  ),
                  child: Icon(
                    Icons.add_a_photo_outlined,
                    color: colors.textColor70,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

/// What a failed upload shows in place of the old flat red wash.
///
/// Sized for a 76×76 tile, so it is an icon and one short word — the full
/// reason has nowhere to live at this size and the icon carries it.
class _FailedOverlay extends StatelessWidget {
  final FileUploadFailureReason? reason;
  final VoidCallback onRetry;

  const _FailedOverlay({required this.reason, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    // Only a network failure can succeed on a second attempt. A file the
    // server rejected or one over the ceiling will fail the same way every
    // time, so those get the plain marker and the rep uses the ✕.
    final retryable =
        reason == FileUploadFailureReason.network || reason == null;

    final overlay = Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(AppRadius.field),
        border: Border.all(color: colors.error, width: 1.5),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              retryable ? Icons.refresh_rounded : Icons.block_rounded,
              color: Colors.white,
              size: 22.sp,
            ),
            SizedBox(height: 2.h),
            Text(
              context.tr(
                retryable
                    ? 'retry'
                    : reason == FileUploadFailureReason.tooLarge
                    ? 'upload_too_large_short'
                    : 'upload_rejected_short',
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );

    if (!retryable) return overlay;
    return GestureDetector(
      onTap: onRetry,
      // The whole tile is the target, not just the glyph — 76dp square is
      // comfortably above the 48dp minimum, and a rep retrying on site is
      // often doing it one-handed.
      behavior: HitTestBehavior.opaque,
      child: overlay,
    );
  }
}

class _PhotoTile extends StatelessWidget {
  final File? file;
  final FileUploadItem? item;
  final VoidCallback onRemove;
  final VoidCallback onTap;
  final VoidCallback onRetry;

  const _PhotoTile({
    required this.file,
    required this.item,
    required this.onRemove,
    required this.onTap,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Stack(
      children: [
        GestureDetector(
          onTap: file == null ? null : onTap,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.field),
            child: SizedBox(
              width: 76.w,
              height: 76.w,
              child: file != null
                  ? Image.file(file!, fit: BoxFit.cover)
                  : Container(color: colors.ink100),
            ),
          ),
        ),
        if (item?.status == FileUploadItemStatus.uploading)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.35),
                borderRadius: BorderRadius.circular(AppRadius.field),
              ),
              child: Center(
                child: SizedBox(
                  width: 22.w,
                  height: 22.w,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    value: item!.progress > 0 ? item!.progress : null,
                    valueColor: const AlwaysStoppedAnimation(Colors.white),
                  ),
                ),
              ),
            ),
          ),
        // A failed upload offers the action that fixes it.
        //
        // This used to be a flat red wash with a static error icon — it
        // announced the problem and then gave the rep nothing to do about
        // it. The only control on the tile was the ✕, so the way to retry a
        // photo that failed on a weak site connection was to delete it and
        // pick it from the gallery again. Reps standing on a building site
        // lose uploads to the network constantly; that is the normal case,
        // not the exceptional one.
        //
        // Only a *network* failure is offered a retry. Re-sending a file the
        // server rejected, or one over the size ceiling, fails identically
        // every time — offering the button there would just be a slower way
        // of reaching the same dead end, so those keep the plain error and
        // the rep removes the photo.
        if (item?.status == FileUploadItemStatus.failed)
          Positioned.fill(
            child: _FailedOverlay(
              reason: item!.failureReason,
              onRetry: onRetry,
            ),
          ),
        Positioned(
          top: 2.h,
          right: 2.w,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              padding: EdgeInsets.all(2.w),
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, size: 14.sp, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
