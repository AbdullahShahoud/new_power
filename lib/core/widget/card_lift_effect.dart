import 'package:flutter/material.dart';

/// ✅ Card Lift/Depth Animation Widget
/// Creates a lifting effect + continuous floating animation
///
/// Features:
/// - Continuous floating up/down motion (4px range)
/// - Smooth Y-axis translation on interaction
/// - Dynamic shadow enhancement on lift
/// - Combines periodic float with tap interaction
///
/// Usage:
/// ```dart
/// CardLiftEffect(
///   isActive: _isPressed,
///   child: YourCardWidget(),
/// )
/// ```
class CardLiftEffect extends StatefulWidget {
  final Widget child;
  final bool isActive;
  final Duration duration;
  final double liftDistance;
  final double shadowBlurRadius;
  final double shadowOffsetY;
  final double floatDistance;
  final Duration floatDuration;

  /// When false, the continuous up/down float is disabled; only the tap-lift
  /// effect remains. The main wallet card disables it so the card stays still.
  final bool enableFloat;

  const CardLiftEffect({
    super.key,
    required this.child,
    required this.isActive,
    this.duration = const Duration(milliseconds: 1300),
    this.liftDistance = 3.0,
    this.shadowBlurRadius = 24.0,
    this.shadowOffsetY = 10.0,
    this.floatDistance = 8.0,
    this.floatDuration = const Duration(milliseconds: 2000),
    this.enableFloat = true,
  });

  @override
  State<CardLiftEffect> createState() => _CardLiftEffectState();
}

class _CardLiftEffectState extends State<CardLiftEffect>
    with TickerProviderStateMixin {
  late AnimationController _tapController;
  late AnimationController _floatController;
  late Animation<double> _liftAnimation;
  late Animation<double> _shadowAnimation;
  late Animation<double> _blurAnimation;
  late Animation<double> _floatAnimation;

  @override
  void initState() {
    super.initState();

    // Tap interaction controller
    _tapController = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _liftAnimation = Tween<double>(
      begin: 0,
      end: widget.liftDistance,
    ).animate(CurvedAnimation(parent: _tapController, curve: Curves.easeOut));

    _shadowAnimation = Tween<double>(
      begin: 0.12,
      end: 0.22,
    ).animate(CurvedAnimation(parent: _tapController, curve: Curves.easeOut));

    _blurAnimation = Tween<double>(
      begin: 16.0,
      end: widget.shadowBlurRadius,
    ).animate(CurvedAnimation(parent: _tapController, curve: Curves.easeOut));

    // Continuous floating animation — only runs when enableFloat is true.
    _floatController = AnimationController(
      duration: widget.floatDuration,
      vsync: this,
    );
    if (widget.enableFloat) {
      _floatController.repeat(reverse: true);
    }

    _floatAnimation = Tween<double>(begin: 0, end: widget.floatDistance)
        .animate(
          CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
        );

    if (widget.isActive) {
      _tapController.forward();
    }
  }

  @override
  void didUpdateWidget(CardLiftEffect oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isActive != oldWidget.isActive) {
      if (widget.isActive) {
        _tapController.forward();
      } else {
        _tapController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _tapController.dispose();
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_tapController, _floatController]),
      builder: (context, child) {
        // Combine both animations: floating motion (always) + tap lift (on press)
        // Float: oscillates between 0 and floatDistance
        // Tap: adds liftDistance on top when active
        final totalYOffset = _floatAnimation.value + _liftAnimation.value;

        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: _shadowAnimation.value),
                blurRadius: _blurAnimation.value,
                offset: Offset(0, widget.isActive ? widget.shadowOffsetY : 6.0),
              ),
            ],
          ),
          child: Transform.translate(
            offset: Offset(0, -totalYOffset),
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
