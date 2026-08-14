import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/widget/image_viewer_screen.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../logic/file_upload_bloc/file_upload_bloc.dart';
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

class _PhotoTile extends StatelessWidget {
  final File? file;
  final FileUploadItem? item;
  final VoidCallback onRemove;
  final VoidCallback onTap;

  const _PhotoTile({
    required this.file,
    required this.item,
    required this.onRemove,
    required this.onTap,
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
        if (item?.status == FileUploadItemStatus.failed)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: colors.error.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(AppRadius.field),
              ),
              child: const Center(
                child: Icon(Icons.error_outline, color: Colors.white),
              ),
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
