import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_power/core/helpers/spacing.dart' show horizontalSpace;

import '../theming/app_colors.dart';
import '../theming/app_radius.dart';
import '../theming/styles.dart';

/// Button variants per DESIGN_GUIDELINES.md §5 "Core component conventions".
enum AppButtonVariant {
  /// brand-500 bg, white text. Hover/pressed brand-600.
  primary,

  /// surface bg, ink-200 border, ink-700 text. Hover/pressed ink-50 bg.
  secondary,
}

/// `md` = `h-10 px-4 text-sm` (default). `sm` = `h-8 px-3 text-xs`.
enum AppButtonSize { md, sm }

class AppButton extends StatefulWidget {
  final String text;
  final Icon? icon;
  final VoidCallback? onPressed;
  final bool isLoading;
  final AppButtonVariant variant;
  final AppButtonSize size;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.md,
    this.icon,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _pressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onPointerDown(PointerDownEvent event) {
    setState(() => _pressed = true);
    _animationController.forward();
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() => _pressed = false);
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isPrimary = widget.variant == AppButtonVariant.primary;
    final isDisabled = widget.onPressed == null && !widget.isLoading;
    final height = widget.size == AppButtonSize.md ? 40.h : 32.h;
    final horizontalPadding = widget.size == AppButtonSize.md ? 16.w : 12.w;
    final textStyle = widget.size == AppButtonSize.md
        ? context.textStyles.smBold
        : context.textStyles.xsBold;

    final Color background;
    final Color foreground;
    final Border? border;
    if (isPrimary) {
      background = _pressed ? colors.brand600 : colors.brand500;
      foreground = colors.white;
      border = null;
    } else {
      background = _pressed ? colors.Color10 : colors.surface;
      foreground = colors.ink700;
      border = Border.all(color: colors.ink200, width: 1);
    }

    return Opacity(
      opacity: isDisabled ? 0.5 : 1,
      child: Listener(
        onPointerDown: widget.isLoading ? null : _onPointerDown,
        onPointerUp: widget.isLoading ? null : _onPointerUp,
        child: GestureDetector(
          onTap: widget.isLoading ? null : widget.onPressed,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: double.infinity,
              height: height,
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(AppRadius.field),
                border: border,
              ),
              child: Center(
                child: widget.isLoading
                    ? SizedBox(
                        width: 18.w,
                        height: 18.h,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(foreground),
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (widget.icon != null) ...[
                            widget.icon!,
                            horizontalSpace(8),
                          ],
                          Flexible(
                            child: Text(
                              widget.text,
                              style: textStyle.copyWith(color: foreground),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
