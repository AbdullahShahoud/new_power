import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_header.dart';
import '../../../../core/widget/empty_state.dart';
import '../../../../core/widget/shimmer_skeleton.dart';
import '../../logic/stakeholders_bloc/stakeholders_bloc.dart';
import '../../logic/stakeholders_bloc/stakeholders_event.dart';
import '../../logic/stakeholders_bloc/stakeholders_state.dart';

/// stakeholders.md `GET /projects/{projectId}/decision-maker/history` —
/// "every decision maker the project has had, newest first... the audit
/// answer to 'who was making the call when that quote was approved'."
class DecisionMakerHistoryScreen extends StatelessWidget {
  final String projectId;
  const DecisionMakerHistoryScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<StakeholdersBloc>()
        ..add(StakeholdersEvent.decisionMakerHistoryRequested(projectId)),
      child: const _DecisionMakerHistoryView(),
    );
  }
}

class _DecisionMakerHistoryView extends StatelessWidget {
  const _DecisionMakerHistoryView();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.page,
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(title: context.tr('decision_maker_history_title')),
            Expanded(
              child: BlocBuilder<StakeholdersBloc, StakeholdersState>(
                builder: (context, state) {
                  return switch (state.historyStatus) {
                    DecisionMakerHistoryStatus.initial ||
                    DecisionMakerHistoryStatus.loading =>
                      const ShimmerCardList(),
                    DecisionMakerHistoryStatus.networkError => Center(
                      child: Text(
                        state.historyErrorMessage ??
                            context.tr('error_unexpected'),
                        style: context.textStyles.smMedium,
                      ),
                    ),
                    DecisionMakerHistoryStatus.empty => EmptyState(
                      icon: Icons.history_outlined,
                      title: context.tr('decision_maker_history_empty_title'),
                      subtitle: context.tr(
                        'decision_maker_history_empty_subtitle',
                      ),
                    ),
                    DecisionMakerHistoryStatus.loaded => ListView.builder(
                      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 24.h),
                      itemCount: state.history.length,
                      itemBuilder: (context, index) {
                        final entry = state.history[index];
                        final isCurrent = entry.endedAt == null;
                        return Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          padding: EdgeInsets.all(14.w),
                          decoration: BoxDecoration(
                            color: colors.surface,
                            borderRadius: BorderRadius.circular(
                              AppRadius.card,
                            ),
                            boxShadow: AppShadows.card,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '${entry.contact.firstName} ${entry.contact.lastName}',
                                      style: context.textStyles.smBold,
                                    ),
                                  ),
                                  if (isCurrent)
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 2.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: colors.statusWon.badgeBg,
                                        borderRadius: BorderRadius.circular(
                                          AppRadius.full,
                                        ),
                                      ),
                                      child: Text(
                                        context.tr(
                                          'decision_maker_history_current',
                                        ),
                                        style: context.textStyles.xsSemibold
                                            .copyWith(
                                              color: colors.statusWon.badgeText,
                                            ),
                                      ),
                                    ),
                                ],
                              ),
                              verticalSpace(2.h),
                              Text(
                                entry.account.name,
                                style: context.textStyles.xsMedium,
                              ),
                              verticalSpace(8.h),
                              Text(
                                '${entry.setAt.toLocal()} '
                                '${entry.endedAt != null ? '→ ${entry.endedAt!.toLocal()}' : ''}',
                                style: context.textStyles.xsMedium.copyWith(
                                  color: colors.textColor70,
                                ),
                              ),
                              if (entry.endReason != null) ...[
                                verticalSpace(6.h),
                                Text(
                                  entry.endReason!,
                                  style: context.textStyles.xsMedium,
                                ),
                              ],
                            ],
                          ),
                        );
                      },
                    ),
                  };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
