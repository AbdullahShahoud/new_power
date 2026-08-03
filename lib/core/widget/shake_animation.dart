import 'package:flutter/material.dart';

/// ✅ Shake Animation Widget
/// Creates a horizontal shake effect for error feedback
///
/// Features:
/// - Smooth horizontal shake on error
/// - 400ms duration with multiple oscillations
/// - Configurable intensity
/// - Auto-triggers on error state change
///
/// Usage:
/// ```dart
/// ShakeAnimation(
///   shake: isError,
///   child: YourWidget(),
/// )
/// ```
class ShakeAnimation extends StatefulWidget {
  final Widget child;
  final bool shake;
  final Duration duration;
  final double distance;

  const ShakeAnimation({
    super.key,
    required this.child,
    required this.shake,
    this.duration = const Duration(milliseconds: 400),
    this.distance = 8.0,
  });

  @override
  State<ShakeAnimation> createState() => _ShakeAnimationState();
}

class _ShakeAnimationState extends State<ShakeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticInOut),
    );

    if (widget.shake) {
      _controller.forward(from: 0.0);
    }
  }

  @override
  void didUpdateWidget(covariant ShakeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shake && !oldWidget.shake) {
      // Trigger shake when error appears
      _controller.forward(from: 0.0);
    } else if (!widget.shake && oldWidget.shake) {
      // Reset when error clears
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
      animation: _animation,
      builder: (context, child) {
        // Create oscillating shake effect
        final shake = ((_animation.value * 6) % 2 - 1);
        return Transform.translate(
          offset: Offset(shake * widget.distance, 0),
          child: child!,
        );
      },
      child: widget.child,
    );
  }
}
