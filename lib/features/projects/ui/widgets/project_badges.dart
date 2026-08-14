import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/enums.dart';
import 'project_enum_labels.dart';

/// Stage/status → `StatusColor` token, a UI color-coding choice documented
/// as an interpretation (not a business rule) in
/// projects-implementation-map.md §10.4: WON→statusWon, LOST→statusLost,
/// ACTIVE→statusNew, DORMANT→statusFollowUp, CANCELLED→statusClosed. Open
/// funnel stages (LEAD..COMMITTED) all read as statusVisit — "in motion,
/// not yet decided" — since the doc's status palette has no per-stage hues.
StatusColor _stageColor(AppColors colors, ProjectStage stage) =>
    switch (stage) {
      ProjectStage.won => colors.statusWon,
      ProjectStage.lost => colors.statusLost,
      _ => colors.statusVisit,
    };

StatusColor _statusColor(AppColors colors, ProjectStatus status) =>
    switch (status) {
      ProjectStatus.active => colors.statusNew,
      ProjectStatus.dormant => colors.statusFollowUp,
      ProjectStatus.cancelled => colors.statusClosed,
    };

class _Badge extends StatelessWidget {
  final String label;
  final StatusColor color;

  const _Badge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      // §5 Status badge: `rounded-full px-2.5 py-0.5 text-xs font-semibold`.
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: color.badgeBg,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        label,
        style: context.textStyles.xsSemibold.copyWith(color: color.badgeText),
      ),
    );
  }
}

class StageBadge extends StatelessWidget {
  final ProjectStage stage;
  const StageBadge({super.key, required this.stage});

  @override
  Widget build(BuildContext context) {
    return _Badge(
      label: context.tr(stage.labelKey),
      color: _stageColor(context.colors, stage),
    );
  }
}

class StatusBadge extends StatelessWidget {
  final ProjectStatus status;
  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return _Badge(
      label: context.tr(status.labelKey),
      color: _statusColor(context.colors, status),
    );
  }
}
