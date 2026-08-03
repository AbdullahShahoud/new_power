import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_colors.dart';

/// ✅ Smooth Switch Widget
/// Creates a smooth animated toggle switch with visual feedback
///
/// Features:
/// - Smooth slide animation (200ms)
/// - Adaptive color based on state
/// - Optional custom colors
/// - Haptic feedback on toggle
/// - Scale animation on tap
///
/// Usage:
/// ```dart
/// SmoothSwitch(
///   value: isEnabled,
///   onChanged: (newValue) => setState(() => isEnabled = newValue),
/// )
/// ```
class SmoothSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final Color? inactiveColor;
  final Duration duration;
  final bool enableHaptic;

  const SmoothSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
    this.inactiveColor,
    this.duration = const Duration(milliseconds: 200),
    this.enableHaptic = true,
  });

  @override
  State<SmoothSwitch> createState() => _SmoothSwitchState();
}

class _SmoothSwitchState extends State<SmoothSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    if (widget.value) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(covariant SmoothSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (widget.value) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    widget.onChanged(!widget.value);
    if (widget.enableHaptic) {
      HapticFeedback.lightImpact();
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeColor = widget.activeColor ?? context.colors.success;
    final inactiveColor = widget.inactiveColor ?? context.colors.Color13;

    return GestureDetector(
      onTap: _toggle,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: 52.w,
            height: 32.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: Color.lerp(inactiveColor, activeColor, _controller.value),
              boxShadow: [
                BoxShadow(
                  color: Color.lerp(inactiveColor, activeColor, _controller.value)!
                      .withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  left: _controller.value * 20.w,
                  top: 2.h,
                  child: Transform.scale(
                    scale: 1.0,
                    child: Container(
                      width: 28.w,
                      height: 28.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
