import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/empty_state.dart';

/// Projects tab — construction-project pipeline (subsystem 04, per
/// stakeholders.md) isn't built yet, so this is an on-brand empty state
/// rather than a fake list.
class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

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
                context.tr('projects_title'),
                style: context.textStyles.lgBold,
              ),
            ),
            verticalSpace(8.h),
            Expanded(
              child: EmptyState(
                icon: Icons.apartment_rounded,
                title: context.tr('projects_empty_title'),
                subtitle: context.tr('projects_empty_subtitle'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
