import 'package:flutter/material.dart';

/// ✅ Glow Animation Widget
/// Creates a pulsing glow effect for success states or active fields
///
/// Features:
/// - Smooth pulsing glow effect
/// - Customizable color and intensity
/// - Optional shadow enhancement
/// - Continuous animation or one-time pulse
///
/// Usage:
/// ```dart
/// GlowAnimation(
///   isActive: isSuccess,
///   glowColor: Colors.green,
///   child: YourWidget(),
/// )
/// ```
class GlowAnimation extends StatefulWidget {
  final Widget child;
  final bool isActive;
  final Color glowColor;
  final Duration duration;
  final bool continuous;

  const GlowAnimation({
    super.key,
    required this.child,
    required this.isActive,
    required this.glowColor,
    this.duration = const Duration(milliseconds: 1000),
    this.continuous = false,
  });

  @override
  State<GlowAnimation> createState() => _GlowAnimationState();
}

class _GlowAnimationState extends State<GlowAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    if (widget.isActive) {
      if (widget.continuous) {
        _controller.repeat(reverse: true);
      } else {
        _controller.forward();
      }
    }
  }

  @override
  void didUpdateWidget(covariant GlowAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive && !oldWidget.isActive) {
      if (widget.continuous) {
        _controller.repeat(reverse: true);
      } else {
        _controller.forward(from: 0.0);
      }
    } else if (!widget.isActive && oldWidget.isActive) {
      _controller.stop();
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacityAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: widget.isActive
                ? [
                    BoxShadow(
                      color: widget.glowColor.withValues(
                        alpha: 0.3 * _opacityAnimation.value,
                      ),
                      blurRadius: 12 * _opacityAnimation.value,
                      spreadRadius: 2 * _opacityAnimation.value,
                    ),
                  ]
                : null,
          ),
          child: child!,
        );
      },
      child: widget.child,
    );
  }
}
