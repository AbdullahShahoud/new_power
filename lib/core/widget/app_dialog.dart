import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/app_colors.dart';
import '../theming/app_radius.dart';
import '../theming/styles.dart';

/// DESIGN_GUIDELINES.md §5 "Dialog": `title text-base font-bold ink-950`,
/// `description text-xs ink-500`, `rounded-card` (§4), `surface` bg — one
/// place implementing the exact recipe instead of every call site falling
/// back to Flutter's Material3 dialog defaults (22px title, 14px body,
/// 28px corner radius — none of which match the doc).
class AppDialog {
  AppDialog._();

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    String? message,
    Widget? content,
    List<Widget> actions = const [],
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (dialogContext) {
        final colors = dialogContext.colors;
        return AlertDialog(
          backgroundColor: colors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.card),
          ),
          // ⚠️ `textColor` / `textColor70`, not raw ramp steps.
          //
          // These were `ink950` and `ink500` — positions on the neutral
          // ramp, which do not flip with the theme. `ink950` is #141412, and
          // in dark mode the dialog's own `surface` is `ink900` (#232220):
          // near-black lettering on a near-black card. The title was
          // effectively invisible, and the body text only marginally better.
          //
          // `textColor` and `textColor70` are the brightness-aware tokens
          // that exist for exactly this, and they resolve to the same inks
          // in light mode — so this is a fix in dark and a no-op in light.
          title: Text(
            title,
            style: dialogContext.textStyles.baseBold.copyWith(
              color: colors.textColor,
            ),
          ),
          content:
              content ??
              (message != null
                  ? Text(
                      message,
                      style: dialogContext.textStyles.xsMedium.copyWith(
                        color: colors.textColor70,
                      ),
                    )
                  : null),
          actionsPadding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 16.h),
          actions: actions,
        );
      },
    );
  }
}

/// Compact dialog-action buttons following §5's Primary/Secondary button
/// recipes at the `sm` size (`h-8 px-3 text-xs`) — `AppButton` itself is
/// full-width (built for forms/screens), too wide for a dialog's action row.
class AppDialogButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isPrimary;

  const AppDialogButton.primary({
    super.key,
    required this.label,
    required this.onPressed,
  }) : isPrimary = true;

  const AppDialogButton.secondary({
    super.key,
    required this.label,
    required this.onPressed,
  }) : isPrimary = false;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyle = context.textStyles.xsBold;
    if (isPrimary) {
      return FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: colors.brand500,
          foregroundColor: colors.white,
          disabledBackgroundColor: colors.brand500.withValues(alpha: 0.5),
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          minimumSize: Size(0, 32.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.field),
          ),
        ),
        child: Text(label, style: textStyle.copyWith(color: colors.white)),
      );
    }
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: colors.surface,
        foregroundColor: colors.ink700,
        side: BorderSide(color: colors.ink200),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        minimumSize: Size(0, 32.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.field),
        ),
      ),
      child: Text(label, style: textStyle.copyWith(color: colors.ink700)),
    );
  }
}

/// A row of dialog action buttons, spaced per §5's button gap convention.
class AppDialogActions extends StatelessWidget {
  final List<Widget> children;
  const AppDialogActions({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < children.length; i++) ...[
          if (i > 0) horizontalSpace(8),
          children[i],
        ],
      ],
    );
  }
}
