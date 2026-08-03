import 'package:flutter/material.dart';

/// ✅ Transaction List Animation
/// Animates transaction items one by one when the list appears
///
/// Features:
/// - Staggered animation (60ms delay between items)
/// - Fade in effect
/// - Slide up from bottom (12px offset)
/// - Smooth easing curve
///
/// Usage:
/// ```dart
/// ListView.builder(
///   itemBuilder: (context, index) {
///     return AnimatedTransactionItem(
///       index: index,
///       child: TransactionItemWidget(),
///     );
///   },
/// )
/// ```
class AnimatedTransactionItem extends StatelessWidget {
  final int index;
  final Widget child;

  const AnimatedTransactionItem({
    super.key,
    required this.index,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Staggered delay: 60ms between each item
    final delay = Duration(milliseconds: 60 * index);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
      child: child,
      builder: (context, value, child) {
        return AnimatedOpacity(
          opacity: value,
          duration: delay + const Duration(milliseconds: 280),
          child: Transform.translate(
            // Slide up: 12px for hidden state, 0px for visible
            offset: Offset(0, 12 * (1 - value)),
            child: child,
          ),
        );
      },
    );
  }
}
