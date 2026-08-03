import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr('welcome'),
                          style: context.textStyles.smRegular,
                        ),
                        // Text(
                        //   context.tr('app_name'),
                        //   style: context.textStyles.xl2Semibold,
                        // ),
                      ],
                    ),
                  ),
                  AppLogo(height: 28.h),
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
