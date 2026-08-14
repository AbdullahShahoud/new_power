import 'dart:io';

import 'package:flutter/material.dart';

/// What kind of thing a pending attachment is, decided once at pick/record
/// time from the file extension.
///
/// §Workflow 1: `POST /files` accepts photos (10 MB), audio (25 MB) and
/// PDF/Word (15 MB). The server reads `contentType` back from storage — the
/// client never asserts it — so this enum exists purely to drive the UI
/// (which icon, which preview, which player).
enum PendingAttachmentKind { image, audio, document }

extension PendingAttachmentKindX on PendingAttachmentKind {
  IconData get icon => switch (this) {
    PendingAttachmentKind.image => Icons.image_outlined,
    PendingAttachmentKind.audio => Icons.mic_none_rounded,
    PendingAttachmentKind.document => Icons.description_outlined,
  };

  String get labelKey => switch (this) {
    PendingAttachmentKind.image => 'attachment_kind_image',
    PendingAttachmentKind.audio => 'attachment_kind_audio',
    PendingAttachmentKind.document => 'attachment_kind_document',
  };
}

/// One attachment the rep has picked or recorded but not yet submitted.
///
/// `localId` is the same id the `FileUploadBloc` tracks progress under, so
/// the tile can show its own upload state without a second lookup table.
class PendingAttachment {
  final String localId;
  final File file;
  final PendingAttachmentKind kind;

  /// Voice notes only — captured at record time because reading it back off
  /// the file would mean decoding it just to draw a label.
  final Duration? duration;

  const PendingAttachment({
    required this.localId,
    required this.file,
    required this.kind,
    this.duration,
  });

  String get displayName => file.uri.pathSegments.last;

  /// Classifies by extension. Anything unrecognised is treated as a
  /// document — the safe default, since the server decides the real content
  /// type anyway and a wrong *icon* is a far smaller problem than refusing
  /// a file the API would have accepted.
  static PendingAttachmentKind kindForPath(String path) {
    final extension = path.split('.').last.toLowerCase();
    const imageExtensions = {'jpg', 'jpeg', 'png', 'gif', 'webp', 'heic'};
    const audioExtensions = {'m4a', 'mp3', 'aac', 'wav', 'ogg', 'opus'};
    if (imageExtensions.contains(extension)) {
      return PendingAttachmentKind.image;
    }
    if (audioExtensions.contains(extension)) {
      return PendingAttachmentKind.audio;
    }
    return PendingAttachmentKind.document;
  }
}

/// `m:ss`, the conventional form for a voice note of realistic length.
String formatAudioDuration(Duration duration) {
  final minutes = duration.inMinutes;
  final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  return '$minutes:$seconds';
}
