import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/empty_state.dart';

/// Notifications tab — no notifications backend exists yet, so this is an
/// on-brand empty state rather than a fake list.
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.page,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
              child: Text(
                context.tr('notifications_title'),
                style: context.textStyles.lgBold,
              ),
            ),
            verticalSpace(8.h),
            Expanded(
              child: EmptyState(
                icon: Icons.notifications_none_rounded,
                title: context.tr('notifications_empty_title'),
                subtitle: context.tr('notifications_empty_subtitle'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
