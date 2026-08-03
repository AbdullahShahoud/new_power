import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/app_colors.dart';

/// Wraps a custom-styled input field with the same focus/error animations the
/// shared [AppTextField] uses on the auth screens: the border highlights to
/// the primary color and a subtle glow appears when the field gains focus;
/// the border turns red when [hasError] is true.
///
/// Use this when you have a custom layout (currency prefix, inline icon, etc.)
/// that doesn't fit [AppTextField] — pass the same [focusNode] to both the
/// inner [TextField] and this wrapper so the animation tracks the field.
class AnimatedFieldContainer extends StatelessWidget {
  final FocusNode focusNode;
  final Widget child;
  final bool hasError;
  final double height;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? fillColor;

  const AnimatedFieldContainer({
    super.key,
    required this.focusNode,
    required this.child,
    this.hasError = false,
    this.height = 52,
    this.padding,
    this.borderRadius,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: focusNode,
      builder: (context, _) {
        final colors = context.colors;
        final isFocused = focusNode.hasFocus;

        final Color borderColor;
        final double borderWidth;
        if (hasError) {
          borderColor = colors.error;
          borderWidth = 1.5;
        } else if (isFocused) {
          borderColor = colors.primary;
          borderWidth = 1.5;
        } else {
          borderColor = colors.Color13;
          borderWidth = 1;
        }

        return AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          height: height.h,
          padding: padding,
          decoration: BoxDecoration(
            color: fillColor ?? colors.Color10,
            borderRadius: borderRadius ?? BorderRadius.circular(12.r),
            border: Border.all(color: borderColor, width: borderWidth),
            boxShadow: isFocused && !hasError
                ? [
                    BoxShadow(
                      color: colors.primary.withValues(alpha: 0.18),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ]
                : null,
          ),
          child: child,
        );
      },
    );
  }
}
