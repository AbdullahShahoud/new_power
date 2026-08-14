import 'package:flutter/material.dart';

/// Shared tap-feedback: scales down to [scale] on press, springs back on
/// release — the same interaction language `AppButton` already uses (a
/// 100ms scale animation), applied to tappable surfaces that aren't
/// buttons (cards, chips, thumbnails) so touch feedback stays consistent
/// app-wide instead of mixing in Material ripple, which nothing else here
/// uses.
class PressableScale extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double scale;

  const PressableScale({
    super.key,
    required this.child,
    required this.onTap,
    this.scale = 0.97,
  });

  @override
  State<PressableScale> createState() => _PressableScaleState();
}

class _PressableScaleState extends State<PressableScale>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1, end: widget.scale).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: widget.onTap == null ? null : (_) => _controller.forward(),
      onPointerUp: widget.onTap == null ? null : (_) => _controller.reverse(),
      onPointerCancel: widget.onTap == null
          ? null
          : (_) => _controller.reverse(),
      child: GestureDetector(
        onTap: widget.onTap,
        child: ScaleTransition(scale: _scaleAnimation, child: widget.child),
      ),
    );
  }
}
