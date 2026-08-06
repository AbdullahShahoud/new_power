import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_logo.dart';

/// Home tab — dashboard landing spot. A real dashboard (pipeline, KPIs,
/// today's visits) belongs to subsystem 04 (Project & Funnel), which isn't
/// built yet (see stakeholders.md), so this is a clean on-brand placeholder
/// rather than a fake data screen.
class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.page,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLogo(height: 28.h),
                  _NotificationBellButton(
                    onTap: () =>
                        context.pushNamed(Routes.notificationsScreen),
                  ),
                ],
              ),
              verticalSpace(24.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  boxShadow: AppShadows.card,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.insights_rounded,
                      color: colors.brand500,
                      size: 28.sp,
                    ),
                    verticalSpace(12.h),
                    Text(
                      context.tr('home_dashboard_placeholder_title'),
                      style: context.textStyles.baseBold,
                    ),
                    verticalSpace(6.h),
                    Text(
                      context.tr('home_dashboard_placeholder_subtitle'),
                      style: context.textStyles.smRegular,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Bell icon opening [Routes.notificationsScreen]. A small tinted circle
/// (Card-recipe-adjacent: brand50 bg, radius-full) rather than a bare
/// `Icons.notifications` glyph, matching the rest of the design system's
/// icon treatment (see the Profile screen's avatar/settings icons).
class _NotificationBellButton extends StatelessWidget {
  final VoidCallback onTap;

  const _NotificationBellButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 40.w,
        height: 40.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colors.brand50,
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        child: Icon(
          Icons.notifications_none_rounded,
          color: colors.brand600,
          size: 20.sp,
        ),
      ),
    );
  }
}
