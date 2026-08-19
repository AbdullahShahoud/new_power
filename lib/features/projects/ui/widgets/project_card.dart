import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../data/models/project_view.dart';
import 'project_badges.dart';
import 'project_enum_labels.dart';

/// One row on `projects_list_screen.dart` — name, building type, stage/
/// status badges, and the counts a `ProjectSummaryView` carries
/// (`imageCount`/`activityCount`/`stakeholderCount`, `distanceM` only on a
/// `near=` query, §9).
class ProjectCard extends StatelessWidget {
  final ProjectSummaryView project;
  final VoidCallback onTap;

  const ProjectCard({super.key, required this.project, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          boxShadow: AppShadows.card,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProjectThumbnail(project: project),
                horizontalSpace(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              project.name,
                              style: context.textStyles.smBold,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          horizontalSpace(8),
                          StageBadge(stage: project.stage),
                        ],
                      ),
                      verticalSpace(6.h),
                      Row(
                        children: [
                          Icon(
                            Icons.apartment_outlined,
                            size: 14.sp,
                            color: colors.textColor70,
                          ),
                          horizontalSpace(4),
                          Expanded(
                            child: Text(
                              context.tr(project.buildingType.labelKey),
                              style: context.textStyles.xsMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (project.distanceM != null) ...[
                            Icon(
                              Icons.near_me_outlined,
                              size: 14.sp,
                              color: colors.textColor70,
                            ),
                            horizontalSpace(4),
                            Text(
                              '${project.distanceM!.round()} ${context.tr('unit_meters_short')}',
                              style: context.textStyles.xsMedium,
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(10.h),
            Row(
              children: [
                StatusBadge(status: project.status),
                const Spacer(),
                _CountChip(
                  icon: Icons.photo_outlined,
                  count: project.imageCount,
                ),
                horizontalSpace(10),
                _CountChip(
                  icon: Icons.event_note_outlined,
                  count: project.activityCount,
                ),
                horizontalSpace(10),
                _CountChip(
                  icon: Icons.groups_outlined,
                  count: project.stakeholderCount,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// The project's cover photo, otherwise a brand-tinted building glyph —
/// never a broken-image box or an empty gap, since the documented list
/// contract doesn't promise photos at all (the server sends `coverImage`
/// regardless, which is what this now reads).
class _ProjectThumbnail extends StatelessWidget {
  final ProjectSummaryView project;

  const _ProjectThumbnail({required this.project});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    // §9: a photo whose URL couldn't be signed arrives with `url: null` —
    // it still counts toward `imageCount`, so the helper picks the first
    // *displayable* one rather than blindly taking `images.first`.
    final url = project.thumbnailUrl;

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.field),
      child: SizedBox(
        width: 56.w,
        height: 56.w,
        child: url == null
            ? _placeholder(context)
            : Image.network(
                url,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => _placeholder(context),
                loadingBuilder: (_, child, progress) => progress == null
                    ? child
                    : ColoredBox(color: colors.ink100),
              ),
      ),
    );
  }

  Widget _placeholder(BuildContext context) {
    final colors = context.colors;
    return ColoredBox(
      color: colors.brand50,
      child: Icon(
        Icons.apartment_rounded,
        size: 24.sp,
        color: colors.brand500,
      ),
    );
  }
}

class _CountChip extends StatelessWidget {
  final IconData icon;
  final int count;

  const _CountChip({required this.icon, required this.count});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13.sp, color: colors.textColor70),
        horizontalSpace(3),
        Text('$count', style: context.textStyles.xsMedium),
      ],
    );
  }
}
