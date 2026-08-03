import 'package:flutter/material.dart';

/// ✅ Custom Shimmer Effect Widget
/// Creates a smooth loading shimmer animation without external dependencies
///
/// Features:
/// - Smooth gradient animation
/// - Customizable colors and duration
/// - Lightweight and performant
///
/// Usage:
/// ```dart
/// ShimmerBase(
///   child: Container(
///     width: 100,
///     height: 20,
///     decoration: BoxDecoration(
///       color: Colors.grey[300],
///       borderRadius: BorderRadius.circular(4),
///     ),
///   ),
/// )
/// ```
class ShimmerBase extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const ShimmerBase({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<ShimmerBase> createState() => _ShimmerBaseState();
}

class _ShimmerBaseState extends State<ShimmerBase>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [
                0.0,
                _animationController.value - 0.1,
                _animationController.value,
                _animationController.value + 0.1,
                1.0,
              ],
              colors: [
                Colors.grey[400]!,
                Colors.grey[300]!,
                Colors.grey[200]!,
                Colors.grey[300]!,
                Colors.grey[400]!,
              ],
              tileMode: TileMode.clamp,
            ).createShader(bounds);
          },
          child: child!,
        );
      },
      child: widget.child,
    );
  }
}
