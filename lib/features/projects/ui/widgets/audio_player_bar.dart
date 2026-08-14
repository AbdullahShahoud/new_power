import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/styles.dart';
import 'pending_attachment.dart';

/// Play/pause + scrub bar for one voice note. Works for both a local file
/// (previewing before send) and a remote URL (playing one back off an
/// activity), which is why it takes a source rather than either type.
///
/// Owns its own [AudioPlayer] and disposes it — several of these can exist
/// in a list, and a shared player would mean tapping one silently stops
/// another with no visual cue on the first.
class AudioPlayerBar extends StatefulWidget {
  /// Local file path, or a remote URL. Exactly one is non-null.
  final String? filePath;
  final String? url;

  /// Known up front for a just-recorded note; otherwise read from the
  /// decoded stream once loaded.
  final Duration? knownDuration;

  const AudioPlayerBar({
    super.key,
    this.filePath,
    this.url,
    this.knownDuration,
  }) : assert(
         filePath != null || url != null,
         'AudioPlayerBar needs a filePath or a url',
       );

  @override
  State<AudioPlayerBar> createState() => _AudioPlayerBarState();
}

class _AudioPlayerBarState extends State<AudioPlayerBar> {
  final _player = AudioPlayer();
  bool _loadFailed = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      if (widget.filePath != null) {
        await _player.setFilePath(widget.filePath!);
      } else {
        await _player.setUrl(widget.url!);
      }
    } catch (_) {
      if (mounted) setState(() => _loadFailed = true);
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _toggle() async {
    if (_player.playing) {
      await _player.pause();
      return;
    }
    // A finished player sits at the end; rewind so the button plays again
    // instead of appearing dead.
    if (_player.processingState == ProcessingState.completed) {
      await _player.seek(Duration.zero);
    }
    await _player.play();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    if (_loadFailed) {
      return Row(
        children: [
          Icon(Icons.error_outline, size: 16.sp, color: colors.error),
          horizontalSpace(6),
          Text(
            context.tr('attachment_audio_unavailable'),
            style: context.textStyles.xsMedium.copyWith(color: colors.error),
          ),
        ],
      );
    }

    return StreamBuilder<PlayerState>(
      stream: _player.playerStateStream,
      builder: (context, playerSnapshot) {
        final isPlaying = playerSnapshot.data?.playing ?? false;
        final isCompleted =
            playerSnapshot.data?.processingState == ProcessingState.completed;
        return Row(
          children: [
            GestureDetector(
              onTap: _toggle,
              child: Container(
                width: 32.w,
                height: 32.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colors.brand50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isPlaying && !isCompleted
                      ? Icons.pause_rounded
                      : Icons.play_arrow_rounded,
                  size: 18.sp,
                  color: colors.brand600,
                ),
              ),
            ),
            horizontalSpace(10),
            Expanded(
              child: StreamBuilder<Duration>(
                stream: _player.positionStream,
                builder: (context, positionSnapshot) {
                  final total =
                      _player.duration ??
                      widget.knownDuration ??
                      Duration.zero;
                  final position = positionSnapshot.data ?? Duration.zero;
                  final progress = total.inMilliseconds == 0
                      ? 0.0
                      : (position.inMilliseconds / total.inMilliseconds)
                            .clamp(0.0, 1.0);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadius.full),
                        child: LinearProgressIndicator(
                          value: progress,
                          minHeight: 4.h,
                          backgroundColor: colors.ink200,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            colors.brand500,
                          ),
                        ),
                      ),
                      verticalSpace(4.h),
                      Text(
                        '${formatAudioDuration(position)} / '
                        '${formatAudioDuration(total)}',
                        style: context.textStyles.xsMedium,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
