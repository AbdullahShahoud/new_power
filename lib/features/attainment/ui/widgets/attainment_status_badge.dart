import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/attainment_enums.dart';
import '../attainment_format.dart';

/// DESIGN_GUIDELINES.md §5 "Status badge": `rounded-full px-2.5 py-0.5
/// text-xs font-semibold`, tinted background + darkened text, taken from
/// the validated status palette (see [statusPalette]).
class AttainmentStatusBadge extends StatelessWidget {
  final AttainmentTargetStatus status;

  /// The screen's own status chips are wider than a table's; `compact`
  /// keeps the version that sits inside a four-column stat row from
  /// stretching its column.
  final bool compact;

  const AttainmentStatusBadge({
    super.key,
    required this.status,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final palette = statusPalette(context, status);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 8.w : 10.w,
        vertical: compact ? 3.h : 5.h,
      ),
      decoration: BoxDecoration(
        color: palette.badgeBg,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        context.tr(status.labelKey),
        style: context.textStyles.xsBold.copyWith(
          color: palette.badgeText,
          fontSize: compact ? 10.sp : 11.sp,
          height: 1.2,
        ),
      ),
    );
  }
}

/// The lifecycle chip on a target card — `PUBLISHED` or `CLOSED`.
///
/// ⚠️ This is the target's **status**, not the calendar: a period whose end
/// has passed but which a manager has not closed still reads PUBLISHED, and
/// still carries pace. `DRAFT` and `SUPERSEDED` never reach this client —
/// a draft is a manager's working copy and a rep must never see one.
class TargetLifecycleBadge extends StatelessWidget {
  final bool closed;

  const TargetLifecycleBadge({super.key, required this.closed});

  @override
  Widget build(BuildContext context) {
    final palette = closed
        ? statusPalette(context, AttainmentTargetStatus.unknown)
        : statusPalette(context, AttainmentTargetStatus.onTrack);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: palette.badgeBg,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        context.tr(
          closed ? 'attainment_lifecycle_closed' : 'attainment_lifecycle_published',
        ),
        style: context.textStyles.xsBold.copyWith(
          color: palette.badgeText,
          fontSize: 11.sp,
          height: 1.2,
        ),
      ),
    );
  }
}
