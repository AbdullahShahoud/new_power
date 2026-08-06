import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widget/app_header.dart';
import '../../../../core/widget/empty_state.dart';

/// Notifications — reached via the bell icon on the Home tab (pushed route,
/// not a bottom-bar tab). No notifications backend exists yet, so this is
/// an on-brand empty state rather than a fake list.
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.page,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(16.h),
            const AppHeader(title: 'notifications_title'),
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
