import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/project_detail_view.dart';
import 'project_badges.dart';

/// The one card that answers "what am I looking at" without scrolling:
/// photo, name, where it is, its short code, and the two badges that carry
/// its state (stage + status).
///
/// Everything here already exists on `ProjectDetailView` — the "code" is the
/// leading segment of the project's own UUID, not a new server field. §9
/// gives projects no human-facing reference number, and inventing one
/// client-side would be fiction; showing a short, copy-recognisable prefix
/// of the real id is honest and still useful when a rep reads an id back
/// over the phone.
class ProjectSummaryCard extends StatelessWidget {
  final ProjectDetailView project;

  const ProjectSummaryCard({super.key, required this.project});

  /// First displayable photo. §9: an image whose URL couldn't be signed
  /// still arrives in `images` with `url: null`, so pick the first one that
  /// can actually render rather than blindly taking `images.first`.
  String? get _imageUrl => project.images
      .map((image) => image.url)
      .where((url) => url != null && url.isNotEmpty)
      .firstOrNull;

  String get _shortCode =>
      '#${project.id.split('-').first.toUpperCase()}';

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final location = project.addressLine?.trim().isNotEmpty == true
        ? project.addressLine!.trim()
        : project.territory?.name;

    return Container(
      width: double.infinity,
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
              _Thumbnail(url: _imageUrl),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      project.name,
                      style: context.textStyles.baseBold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (location != null) ...[
                      verticalSpace(4.h),
                      Row(
                        children: [
                          Icon(
                            Icons.place_outlined,
                            size: 13.sp,
                            color: colors.textColor70,
                          ),
                          horizontalSpace(3),
                          Expanded(
                            child: Text(
                              location,
                              style: context.textStyles.xsMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                    verticalSpace(6.h),
                    Text(
                      _shortCode,
                      style: context.textStyles.xsMedium.copyWith(
                        color: colors.ink400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(12.h),
          // Wrap, not Row: Arabic stage labels are long enough to overflow a
          // single line on narrow devices.
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              StageBadge(stage: project.stage),
              StatusBadge(status: project.status),
              if (project.outsideTerritory)
                _OutsideTerritoryBadge(
                  label: context.tr('projects_detail_outside_territory'),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Thumbnail extends StatelessWidget {
  final String? url;

  const _Thumbnail({required this.url});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppRadius.field),
      child: SizedBox(
        width: 88.w,
        height: 88.w,
        child: url == null
            ? _placeholder(colors)
            : Image.network(
                url!,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => _placeholder(colors),
                loadingBuilder: (_, child, progress) =>
                    progress == null ? child : ColoredBox(color: colors.ink100),
              ),
      ),
    );
  }

  Widget _placeholder(AppColors colors) {
    return ColoredBox(
      color: colors.brand50,
      child: Icon(
        Icons.apartment_rounded,
        size: 32.sp,
        color: colors.brand500,
      ),
    );
  }
}

/// §5 "quiet badge" for `outsideTerritory` — the doc is explicit that this
/// is informational ("back office will assign"), never an error, so it uses
/// the neutral ink palette rather than a status colour.
class _OutsideTerritoryBadge extends StatelessWidget {
  final String label;

  const _OutsideTerritoryBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: colors.ink100,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        label,
        style: context.textStyles.xsSemibold.copyWith(color: colors.ink600),
      ),
    );
  }
}
