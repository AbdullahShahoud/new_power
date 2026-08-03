import 'package:flutter/material.dart';

/// ✅ Tab Switch Animation Widget
/// Creates smooth fade + slide transitions when switching between tabs
///
/// Features:
/// - Smooth fade transition (300ms)
/// - Optional slight slide or scale effect
/// - Fast, responsive animation
/// - Works with any tab content
///
/// Usage:
/// ```dart
/// TabSwitchAnimation(
///   child: YourTabContent(),
/// )
/// ```
class TabSwitchAnimation extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final bool enableSlide;
  final bool enableScale;

  const TabSwitchAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.enableSlide = true,
    this.enableScale = false,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      transitionBuilder: (child, animation) {
        if (enableScale) {
          return ScaleTransition(
            scale: Tween<double>(begin: 0.95, end: 1.0).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        }

        if (enableSlide) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.1, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        }

        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: child,
    );
  }
}
