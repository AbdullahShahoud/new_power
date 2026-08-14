import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';

import '../../../../core/helpers/bottom_sheet_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/image_viewer_screen.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../logic/file_upload_bloc/file_upload_bloc.dart';
import '../../logic/file_upload_bloc/file_upload_state.dart';
import 'audio_player_bar.dart';
import 'pending_attachment.dart';
import 'voice_recorder_sheet.dart';

/// Attachment list for logging an activity: photos, documents and voice
/// notes, each previewable **before** it's sent.
///
/// Replaces the photo-only grid here because §Workflow 1 accepts all three
/// (10 MB images, 25 MB audio, 15 MB documents) and a rep on site often has
/// a BOQ PDF or a spoken note rather than a picture. The project-photo grid
/// stays image-only — a building's gallery genuinely is just photos.
class AttachmentPicker extends StatelessWidget {
  final List<PendingAttachment> attachments;
  final int maxAttachments;
  final ValueChanged<List<PendingAttachment>> onAdded;
  final ValueChanged<String> onRemove;

  const AttachmentPicker({
    super.key,
    required this.attachments,
    required this.onAdded,
    required this.onRemove,
    this.maxAttachments = 10,
  });

  bool get _isFull => attachments.length >= maxAttachments;

  Future<void> _openSourceSheet(BuildContext context) async {
    final source = await showAnimatedBottomSheet<_AttachmentSource>(
      context: context,
      initialChildSize: 0.34,
      minChildSize: 0.34,
      builder: (sheetContext) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final source in _AttachmentSource.values)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(source.icon),
              title: Text(sheetContext.tr(source.labelKey)),
              onTap: () => Navigator.of(sheetContext).pop(source),
            ),
        ],
      ),
    );
    if (source == null || !context.mounted) return;

    switch (source) {
      case _AttachmentSource.camera:
        await _pickImages(context, fromCamera: true);
      case _AttachmentSource.gallery:
        await _pickImages(context, fromCamera: false);
      case _AttachmentSource.document:
        await _pickDocuments(context);
      case _AttachmentSource.voice:
        await _recordVoiceNote(context);
    }
  }

  int get _remaining => maxAttachments - attachments.length;

  Future<void> _pickImages(
    BuildContext context, {
    required bool fromCamera,
  }) async {
    final picker = ImagePicker();
    final picked = fromCamera
        ? await picker
              .pickImage(source: ImageSource.camera, imageQuality: 85)
              .then((file) => file == null ? <XFile>[] : [file])
        : await picker.pickMultiImage(imageQuality: 85);
    if (picked.isEmpty) return;
    onAdded([
      for (final file in picked.take(_remaining))
        PendingAttachment(
          localId: UniqueKey().toString(),
          file: File(file.path),
          kind: PendingAttachmentKind.image,
        ),
    ]);
  }

  Future<void> _pickDocuments(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      // Matches the documented accepted document types; audio has its own
      // entry point (recording) so it isn't offered here.
      allowedExtensions: const ['pdf', 'doc', 'docx'],
    );
    if (result == null) return;
    final paths = result.paths.whereType<String>().take(_remaining);
    onAdded([
      for (final path in paths)
        PendingAttachment(
          localId: UniqueKey().toString(),
          file: File(path),
          kind: PendingAttachment.kindForPath(path),
        ),
    ]);
  }

  Future<void> _recordVoiceNote(BuildContext context) async {
    final result = await showAnimatedBottomSheet<VoiceRecordingResult>(
      context: context,
      initialChildSize: 0.42,
      minChildSize: 0.42,
      enableGrabber: false,
      builder: (_) => const VoiceRecorderSheet(),
    );
    if (result == null) return;
    onAdded([
      PendingAttachment(
        localId: UniqueKey().toString(),
        file: result.file,
        kind: PendingAttachmentKind.audio,
        duration: result.duration,
      ),
    ]);
  }

  /// Preview before sending — the whole point of the tile being tappable.
  /// Images open in the in-app viewer; documents hand off to whatever the
  /// OS uses; audio plays inline, so it has no tap action here.
  Future<void> _preview(BuildContext context, PendingAttachment item) async {
    switch (item.kind) {
      case PendingAttachmentKind.image:
        final images = attachments
            .where((a) => a.kind == PendingAttachmentKind.image)
            .toList();
        final index = images.indexWhere((a) => a.localId == item.localId);
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ImageViewerScreen(
              images: [for (final image in images) ViewableImage.file(image.file)],
              initialIndex: index < 0 ? 0 : index,
            ),
          ),
        );
      case PendingAttachmentKind.document:
        await OpenFilex.open(item.file.path);
      case PendingAttachmentKind.audio:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final item in attachments)
          Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: _AttachmentTile(
              attachment: item,
              onRemove: () => onRemove(item.localId),
              onPreview: () => _preview(context, item),
            ),
          ),
        if (!_isFull)
          PressableScale(
            onTap: () => _openSourceSheet(context),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(AppRadius.field),
                border: Border.all(color: colors.ink200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.attach_file_rounded,
                    size: 16.sp,
                    color: colors.brand600,
                  ),
                  horizontalSpace(6),
                  Text(
                    context.tr('attachment_add'),
                    style: context.textStyles.smBold.copyWith(
                      color: colors.brand600,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

enum _AttachmentSource { camera, gallery, document, voice }

extension _AttachmentSourceX on _AttachmentSource {
  IconData get icon => switch (this) {
    _AttachmentSource.camera => Icons.photo_camera_outlined,
    _AttachmentSource.gallery => Icons.photo_library_outlined,
    _AttachmentSource.document => Icons.description_outlined,
    _AttachmentSource.voice => Icons.mic_none_rounded,
  };

  String get labelKey => switch (this) {
    _AttachmentSource.camera => 'projects_register_photo_camera',
    _AttachmentSource.gallery => 'projects_register_photo_gallery',
    _AttachmentSource.document => 'attachment_source_document',
    _AttachmentSource.voice => 'attachment_source_voice',
  };
}

/// One pending attachment. Audio renders its player inline (a voice note is
/// only checkable by listening); images and documents show a thumbnail or
/// icon and open on tap.
class _AttachmentTile extends StatelessWidget {
  final PendingAttachment attachment;
  final VoidCallback onRemove;
  final VoidCallback onPreview;

  const _AttachmentTile({
    required this.attachment,
    required this.onRemove,
    required this.onPreview,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isAudio = attachment.kind == PendingAttachmentKind.audio;

    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.field),
        border: Border.all(color: colors.ink200),
      ),
      child: Column(
        children: [
          Row(
            children: [
              if (attachment.kind == PendingAttachmentKind.image)
                GestureDetector(
                  onTap: onPreview,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.file(
                      attachment.file,
                      width: 40.w,
                      height: 40.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              else
                Container(
                  width: 40.w,
                  height: 40.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colors.brand50,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(
                    attachment.kind.icon,
                    size: 18.sp,
                    color: colors.brand600,
                  ),
                ),
              horizontalSpace(10),
              Expanded(
                child: GestureDetector(
                  onTap: isAudio ? null : onPreview,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        attachment.displayName,
                        style: context.textStyles.xsSemibold,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        context.tr(attachment.kind.labelKey),
                        style: context.textStyles.xsMedium,
                      ),
                    ],
                  ),
                ),
              ),
              _UploadStatusDot(localId: attachment.localId),
              horizontalSpace(6),
              GestureDetector(
                onTap: onRemove,
                child: Icon(
                  Icons.close_rounded,
                  size: 18.sp,
                  color: colors.textColor70,
                ),
              ),
            ],
          ),
          if (isAudio) ...[
            verticalSpace(8.h),
            AudioPlayerBar(
              filePath: attachment.file.path,
              knownDuration: attachment.duration,
            ),
          ],
        ],
      ),
    );
  }
}

/// Mirrors the upload state the `FileUploadBloc` already tracks under this
/// `localId` — a spinner while in flight, a tick once the key is back, a
/// warning if it failed.
class _UploadStatusDot extends StatelessWidget {
  final String localId;

  const _UploadStatusDot({required this.localId});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocBuilder<FileUploadBloc, FileUploadState>(
      buildWhen: (previous, current) =>
          previous.uploads[localId]?.status != current.uploads[localId]?.status,
      builder: (context, state) {
        final status = state.uploads[localId]?.status;
        return switch (status) {
          FileUploadItemStatus.uploading => SizedBox(
            width: 14.w,
            height: 14.w,
            child: const CircularProgressIndicator(strokeWidth: 2),
          ),
          FileUploadItemStatus.uploaded => Icon(
            Icons.check_circle,
            size: 16.sp,
            color: colors.statusWon.core,
          ),
          FileUploadItemStatus.failed => Icon(
            Icons.error_outline,
            size: 16.sp,
            color: colors.error,
          ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
