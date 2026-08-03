import 'package:flutter/material.dart';

/// ✅ Animated IndexedStack
/// Provides fade + slide animation when switching between indexed children
/// while maintaining IndexedStack's performance (keeps all children alive)
///
/// Features:
/// - Smooth fade + slide transitions
/// - Fast 300ms animation duration
/// - Keeps all children alive in IndexedStack (efficient state management)
/// - Works exactly like IndexedStack but with animations
///
/// Usage:
/// ```dart
/// AnimatedIndexedStack(
///   index: currentIndex,
///   children: [
///     HomeScreen(),
///     ProfileScreen(),
///   ],
/// )
/// ```
class AnimatedIndexedStack extends StatefulWidget {
  final int index;
  final List<Widget> children;
  final AlignmentGeometry alignment;
  final TextDirection? textDirection;
  final StackFit sizing;

  const AnimatedIndexedStack({
    super.key,
    required this.index,
    required this.children,
    this.alignment = AlignmentDirectional.topStart,
    this.textDirection,
    this.sizing = StackFit.loose,
  });

  @override
  State<AnimatedIndexedStack> createState() => _AnimatedIndexedStackState();
}

class _AnimatedIndexedStackState extends State<AnimatedIndexedStack>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _slideAnimation = Tween<Offset>(begin: const Offset(0.08, 0.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _animationController, curve: Curves.easeOut));

    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant AnimatedIndexedStack oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      // Reset and restart animation on index change
      _animationController.forward(from: 0.0);
    }
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
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: IndexedStack(
              index: widget.index,
              alignment: widget.alignment,
              textDirection: widget.textDirection,
              sizing: widget.sizing,
              children: widget.children,
            ),
          ),
        );
      },
    );
  }
}
