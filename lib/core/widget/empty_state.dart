import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';
import '../theming/app_colors.dart';
import '../theming/app_radius.dart';
import '../theming/styles.dart';

/// Generic "nothing here yet" state — icon in a tinted circle, title,
/// optional subtitle. Reused by tab screens whose backend module isn't
/// built yet (Projects/Notifications: subsystem 04 isn't live per
/// stakeholders.md), so they read as an intentional empty state rather than
/// a broken/blank screen.
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72.w,
              height: 72.w,
              decoration: BoxDecoration(
                color: colors.brand50,
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              child: Icon(icon, size: 32.sp, color: colors.brand500),
            ),
            verticalSpace(16.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: context.textStyles.baseBold,
            ),
            if (subtitle != null) ...[
              verticalSpace(8.h),
              Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: context.textStyles.smRegular,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
