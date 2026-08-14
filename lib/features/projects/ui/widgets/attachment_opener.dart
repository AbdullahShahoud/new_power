
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/bottom_sheet_helper.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/image_viewer_screen.dart';
import '../../data/repo/file_repository.dart';
import 'audio_player_bar.dart';
import 'pending_attachment.dart';

/// Opens a *saved* activity attachment.
///
/// §Workflow 11: an activity's `attachments[].key` is a bare storage key,
/// **not** a pre-signed URL (unlike a project photo) — "a list of thirty
/// activities would mean thirty signing round trips for files nobody
/// clicks". So the key is exchanged for a fresh URL via `POST /files/resolve`
/// at the moment something is actually opened, which is exactly here.
///
/// Documents are downloaded to the cache first because `open_filex` hands a
/// *local* path to the OS viewer; images and audio stream from the signed
/// URL directly.
class AttachmentOpener {
  AttachmentOpener._();

  static Future<void> open(
    BuildContext context, {
    required String key,
    required String name,
    String? contentType,
    String? existingUrl,
  }) async {
    final messenger = ScaffoldMessenger.of(context);
    final unavailable = context.tr('attachment_audio_unavailable');
    final openFailed = context.tr('attachment_open_failed');

    // A URL already on the payload (and unexpired) saves a round trip; the
    // resolve call is the fallback, not the default path.
    var url = existingUrl;
    if (url == null || url.isEmpty) {
      final result = await getIt<FileRepository>().resolveFile(key);
      switch (result) {
        case Success(data: final file):
          url = file.url;
        case Failure():
          url = null;
      }
    }

    if (!context.mounted) return;
    if (url == null || url.isEmpty) {
      messenger.showSnackBar(SnackBar(content: Text(unavailable)));
      return;
    }

    final kind = _kindFor(contentType, name);
    switch (kind) {
      case PendingAttachmentKind.image:
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ImageViewerScreen(
              images: [ViewableImage.network(url!, caption: name)],
            ),
          ),
        );
      case PendingAttachmentKind.audio:
        await showAnimatedBottomSheet<void>(
          context: context,
          initialChildSize: 0.24,
          minChildSize: 0.24,
          builder: (sheetContext) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: sheetContext.textStyles.smBold),
              verticalSpace(12.h),
              AudioPlayerBar(url: url),
            ],
          ),
        );
      case PendingAttachmentKind.document:
        await _openDocument(url, name, messenger, openFailed);
    }
  }

  /// Streams the file into the cache directory, then hands it to whatever
  /// the OS uses for that type. Cached under its real name so the viewer
  /// shows something meaningful in its title bar.
  static Future<void> _openDocument(
    String url,
    String name,
    ScaffoldMessengerState messenger,
    String failureMessage,
  ) async {
    try {
      final directory = await getTemporaryDirectory();
      final path = '${directory.path}/$name';
      await Dio().download(url, path);
      final result = await OpenFilex.open(path);
      if (result.type != ResultType.done) {
        messenger.showSnackBar(SnackBar(content: Text(failureMessage)));
      }
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(failureMessage)));
    }
  }

  /// Prefers the server's own `contentType` — it read that back from
  /// storage, so it beats guessing from a filename. Falls back to the
  /// extension when it's absent.
  static PendingAttachmentKind _kindFor(String? contentType, String name) {
    if (contentType != null && contentType.isNotEmpty) {
      if (contentType.startsWith('image/')) return PendingAttachmentKind.image;
      if (contentType.startsWith('audio/')) return PendingAttachmentKind.audio;
      return PendingAttachmentKind.document;
    }
    return PendingAttachment.kindForPath(name);
  }
}
