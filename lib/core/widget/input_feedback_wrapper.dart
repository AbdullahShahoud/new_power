import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theming/app_colors.dart';

/// ✅ Input Feedback Wrapper
/// Provides micro feedback animations for any input widget
///
/// Features:
/// - Shake animation on error
/// - Glow animation on focus
/// - Success state animations
/// - Auto haptic feedback on validation
/// - Smooth transitions between states
///
/// Usage:
/// ```dart
/// InputFeedbackWrapper(
///   state: ValidationState.error,
///   child: YourInputWidget(),
/// )
/// ```
enum InputFeedbackState { idle, focused, success, error }

class InputFeedbackWrapper extends StatefulWidget {
  final Widget child;
  final InputFeedbackState state;
  final Duration animationDuration;
  final bool enableHaptic;
  final VoidCallback? onErrorShake;

  const InputFeedbackWrapper({
    super.key,
    required this.child,
    required this.state,
    this.animationDuration = const Duration(milliseconds: 250),
    this.enableHaptic = true,
    this.onErrorShake,
  });

  @override
  State<InputFeedbackWrapper> createState() => _InputFeedbackWrapperState();
}

class _InputFeedbackWrapperState extends State<InputFeedbackWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _shakeController;
  late Animation<double> _shakeAnimation;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _shakeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.elasticInOut),
    );
  }

  @override
  void didUpdateWidget(covariant InputFeedbackWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.state == InputFeedbackState.error &&
        oldWidget.state != InputFeedbackState.error) {
      if (widget.enableHaptic) {
        HapticFeedback.heavyImpact();
      }
      _shakeController.forward(from: 0.0);
      widget.onErrorShake?.call();
    } else if (widget.state != InputFeedbackState.error &&
        oldWidget.state == InputFeedbackState.error) {
      _shakeController.reset();
    }
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  Color _getGlowColor(BuildContext context) {
    switch (widget.state) {
      case InputFeedbackState.success:
        return context.colors.success;
      case InputFeedbackState.error:
        return context.colors.error;
      case InputFeedbackState.focused:
        return context.colors.primary;
      case InputFeedbackState.idle:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shakeAnimation,
      builder: (context, child) {
        // Shake effect
        final shake = ((_shakeAnimation.value * 6) % 2 - 1);

        return Transform.translate(
          offset: Offset(shake * 8.0, 0),
          child: AnimatedContainer(
            duration: widget.animationDuration,
            decoration: BoxDecoration(
              boxShadow: widget.state == InputFeedbackState.focused ||
                      widget.state == InputFeedbackState.success
                  ? [
                      BoxShadow(
                        color: _getGlowColor(context).withValues(
                          alpha: widget.state == InputFeedbackState.success
                              ? 0.4
                              : 0.2,
                        ),
                        blurRadius:
                            widget.state == InputFeedbackState.success ? 16 : 12,
                        spreadRadius: 1,
                      ),
                    ]
                  : null,
            ),
            child: child!,
          ),
        );
      },
      child: widget.child,
    );
  }
}
