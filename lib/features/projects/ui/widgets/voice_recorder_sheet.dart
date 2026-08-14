import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_button.dart';
import 'pending_attachment.dart';

/// A voice-note recorder in the WhatsApp shape: one big record button, a
/// live timer, a live level meter, and a cancel-or-keep decision at the end.
///
/// Records to AAC in an `.m4a` container — small enough for a rep on two
/// bars of signal, and playable on both platforms without a codec shim.
///
/// Pops the recorded [File] plus its [Duration], or `null` if the rep
/// cancelled. Deleting the temp file on cancel matters: these land in the
/// app's cache directory and would otherwise accumulate silently.
class VoiceRecorderSheet extends StatefulWidget {
  const VoiceRecorderSheet({super.key});

  @override
  State<VoiceRecorderSheet> createState() => _VoiceRecorderSheetState();
}

class _VoiceRecorderSheetState extends State<VoiceRecorderSheet> {
  final _recorder = AudioRecorder();

  Timer? _ticker;
  StreamSubscription<Amplitude>? _amplitudeSub;

  Duration _elapsed = Duration.zero;
  double _level = 0;
  bool _isRecording = false;
  String? _path;
  String? _error;

  /// A hard ceiling so a pocket-dial can't produce a 40-minute file that
  /// then fails the 25 MB limit after the rep has waited through the upload.
  static const _maxDuration = Duration(minutes: 5);

  @override
  void dispose() {
    _ticker?.cancel();
    _amplitudeSub?.cancel();
    _recorder.dispose();
    super.dispose();
  }

  Future<void> _start() async {
    setState(() => _error = null);
    try {
      if (!await _recorder.hasPermission()) {
        setState(() => _error = context.tr('voice_note_permission_denied'));
        return;
      }
      final directory = await getTemporaryDirectory();
      final path =
          '${directory.path}/voice_${DateTime.now().millisecondsSinceEpoch}.m4a';
      await _recorder.start(
        const RecordConfig(encoder: AudioEncoder.aacLc),
        path: path,
      );

      _ticker = Timer.periodic(const Duration(milliseconds: 200), (_) {
        if (!mounted) return;
        setState(() => _elapsed += const Duration(milliseconds: 200));
        if (_elapsed >= _maxDuration) _stop();
      });

      // Drives the level meter. `amplitude.current` is dBFS (negative,
      // ~-45 quiet .. 0 loud), normalised to 0..1 for the bar heights.
      _amplitudeSub = _recorder
          .onAmplitudeChanged(const Duration(milliseconds: 200))
          .listen((amplitude) {
            if (!mounted) return;
            final normalized = ((amplitude.current + 45) / 45).clamp(0.0, 1.0);
            setState(() => _level = normalized);
          });

      setState(() {
        _isRecording = true;
        _path = path;
        _elapsed = Duration.zero;
      });
    } catch (_) {
      if (mounted) setState(() => _error = context.tr('voice_note_error'));
    }
  }

  Future<void> _stop() async {
    _ticker?.cancel();
    await _amplitudeSub?.cancel();
    try {
      await _recorder.stop();
    } catch (_) {
      // A failed stop still leaves whatever was flushed to disk; the
      // length check below decides whether it's usable.
    }
    if (mounted) setState(() => _isRecording = false);
  }

  Future<void> _cancel() async {
    if (_isRecording) await _stop();
    final path = _path;
    if (path != null) {
      final file = File(path);
      if (await file.exists()) await file.delete();
    }
    if (mounted) context.pop();
  }

  Future<void> _keep() async {
    if (_isRecording) await _stop();
    final path = _path;
    if (path == null) return;
    final file = File(path);
    if (!await file.exists() || await file.length() == 0) {
      if (mounted) setState(() => _error = context.tr('voice_note_too_short'));
      return;
    }
    if (mounted) {
      context.pop(
        VoiceRecordingResult(file: file, duration: _elapsed),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final hasRecording = _path != null && !_isRecording;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.tr('voice_note_title'),
            style: context.textStyles.baseBold,
          ),
          verticalSpace(6.h),
          Text(
            formatAudioDuration(_elapsed),
            style: context.textStyles.lgBold.copyWith(
              color: _isRecording ? colors.error : colors.textColor,
            ),
          ),
          verticalSpace(16.h),
          _LevelMeter(level: _level, active: _isRecording),
          verticalSpace(20.h),
          if (_error != null) ...[
            Text(
              _error!,
              textAlign: TextAlign.center,
              style: context.textStyles.xsMedium.copyWith(color: colors.error),
            ),
            verticalSpace(12.h),
          ],
          if (!_isRecording && !hasRecording)
            _RecordButton(onTap: _start, isRecording: false)
          else if (_isRecording)
            _RecordButton(onTap: _stop, isRecording: true)
          else
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    text: context.tr('voice_note_discard'),
                    variant: AppButtonVariant.secondary,
                    onPressed: _cancel,
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: AppButton(
                    text: context.tr('voice_note_attach'),
                    onPressed: _keep,
                  ),
                ),
              ],
            ),
          verticalSpace(12.h),
          if (!hasRecording)
            GestureDetector(
              onTap: _cancel,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6.h),
                child: Text(
                  context.tr('cancel'),
                  style: context.textStyles.smMedium,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// What [VoiceRecorderSheet] pops on success.
class VoiceRecordingResult {
  final File file;
  final Duration duration;

  const VoiceRecordingResult({required this.file, required this.duration});
}

/// Bars that react to live input level. Purely indicative — its job is to
/// show the mic is actually hearing something, which is the one thing a
/// timer alone can't confirm.
class _LevelMeter extends StatelessWidget {
  final double level;
  final bool active;

  const _LevelMeter({required this.level, required this.active});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return SizedBox(
      height: 36.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (var i = 0; i < 21; i++)
            _MeterBar(
              index: i,
              level: active ? level : 0,
              color: active ? colors.brand500 : colors.ink200,
            ),
        ],
      ),
    );
  }
}

class _MeterBar extends StatelessWidget {
  final int index;
  final double level;
  final Color color;

  const _MeterBar({
    required this.index,
    required this.level,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    // Bars nearer the centre react more, so the meter reads as a waveform
    // rather than a flat block.
    final distanceFromCentre = (index - 10).abs() / 10;
    final falloff = 1 - (distanceFromCentre * 0.75);
    final height = (6 + (level * 30 * falloff)).clamp(4.0, 36.0);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: 3.w,
      height: height.h,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
    );
  }
}

class _RecordButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isRecording;

  const _RecordButton({required this.onTap, required this.isRecording});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 64.w,
        height: 64.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isRecording ? colors.error : colors.brand500,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: (isRecording ? colors.error : colors.brand500).withValues(
                alpha: 0.3,
              ),
              blurRadius: 16,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Icon(
          isRecording ? Icons.stop_rounded : Icons.mic_rounded,
          color: colors.white,
          size: 28.sp,
        ),
      ),
    );
  }
}
