import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_header.dart';
import '../../../../core/widget/empty_state.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../../../core/widget/shimmer_skeleton.dart';
import '../../data/models/enums.dart';
import '../../data/models/outcome_view.dart';
import '../../logic/outcomes_bloc/outcomes_bloc.dart';
import '../../logic/outcomes_bloc/outcomes_event.dart';
import '../../logic/outcomes_bloc/outcomes_filter.dart';
import '../../logic/outcomes_bloc/outcomes_state.dart';
import '../widgets/project_enum_labels.dart';

/// `GET /outcomes` — "my outcomes." Scoped automatically server-side by
/// role (a rep sees their own; a manager sees their team's), so this one
/// screen doubles as the manager's confirmation queue when filtered to
/// `PENDING`, without the app needing to know the caller's role.
class OutcomesListScreen extends StatelessWidget {
  const OutcomesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OutcomesBloc>()
        ..add(const OutcomesEvent.listRequested(OutcomesFilter())),
      child: const _OutcomesListView(),
    );
  }
}

class _OutcomesListView extends StatefulWidget {
  const _OutcomesListView();

  @override
  State<_OutcomesListView> createState() => _OutcomesListViewState();
}

class _OutcomesListViewState extends State<_OutcomesListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<OutcomesBloc>().add(
        const OutcomesEvent.nextPageRequested(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.page,
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(title: context.tr('outcomes_list_title')),
            verticalSpace(12.h),
            const _StatusFilterChips(),
            verticalSpace(8.h),
            Expanded(
              child: BlocBuilder<OutcomesBloc, OutcomesState>(
                builder: (context, state) {
                  return switch (state.listStatus) {
                    OutcomesFeedStatus.initial ||
                    OutcomesFeedStatus.loading => const ShimmerCardList(),
                    OutcomesFeedStatus.networkError => _ListError(
                      message: state.listErrorMessage,
                    ),
                    OutcomesFeedStatus.empty => EmptyState(
                      icon: Icons.flag_outlined,
                      title: context.tr('outcomes_list_empty_title'),
                      subtitle: context.tr('outcomes_list_empty_subtitle'),
                    ),
                    OutcomesFeedStatus.loaded ||
                    OutcomesFeedStatus.paginationLoading => ListView.builder(
                      controller: _scrollController,
                      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 24.h),
                      itemCount:
                          state.outcomes.length +
                          (state.listStatus ==
                                  OutcomesFeedStatus.paginationLoading
                              ? 1
                              : 0),
                      itemBuilder: (context, index) {
                        if (index >= state.outcomes.length) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        return _OutcomeCard(outcome: state.outcomes[index]);
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

class _StatusFilterChips extends StatelessWidget {
  const _StatusFilterChips();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OutcomesBloc, OutcomesState>(
      buildWhen: (previous, current) =>
          previous.filter.status != current.filter.status,
      builder: (context, state) {
        final selected = state.filter.status;
        return SizedBox(
          height: 34.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            children: [
              _Chip(
                label: context.tr('projects_filter_all'),
                selected: selected == null,
                onTap: () => context.read<OutcomesBloc>().add(
                  OutcomesEvent.listRequested(
                    state.filter.copyWith(status: null),
                  ),
                ),
              ),
              for (final status in OutcomeStatus.values) ...[
                horizontalSpace(8),
                _Chip(
                  label: context.tr(status.labelKey),
                  selected: selected == status,
                  onTap: () => context.read<OutcomesBloc>().add(
                    OutcomesEvent.listRequested(
                      state.filter.copyWith(
                        status: selected == status ? null : status,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _Chip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        decoration: BoxDecoration(
          color: selected ? colors.brand500 : colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.full),
          border: Border.all(
            color: selected ? colors.brand500 : colors.ink200,
          ),
        ),
        child: Text(
          label,
          style: context.textStyles.xsSemibold.copyWith(
            color: selected ? colors.white : colors.textColor,
          ),
        ),
      ),
    );
  }
}

class _OutcomeCard extends StatelessWidget {
  final OutcomeView outcome;
  const _OutcomeCard({required this.outcome});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final statusColor = switch (outcome.status) {
      OutcomeStatus.pending => colors.statusFollowUp,
      OutcomeStatus.confirmed => colors.statusWon,
      OutcomeStatus.rejected => colors.statusLost,
    };
    return PressableScale(
      onTap: () => context.pushNamed(
        Routes.outcomeDetailScreen,
        arguments: {'outcomeId': outcome.id},
      ),
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
              children: [
                Expanded(
                  child: Text(
                    outcome.projectName,
                    style: context.textStyles.smBold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                horizontalSpace(8),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.badgeBg,
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                  child: Text(
                    context.tr(outcome.status.labelKey),
                    style: context.textStyles.xsSemibold.copyWith(
                      color: statusColor.badgeText,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(6.h),
            Text(
              context.tr(outcome.type.labelKey),
              style: context.textStyles.xsMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _ListError extends StatelessWidget {
  final String? message;
  const _ListError({this.message});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.wifi_off_rounded,
              size: 40.sp,
              color: colors.textColor70,
            ),
            verticalSpace(12.h),
            Text(
              context.tr('outcomes_list_error'),
              textAlign: TextAlign.center,
              style: context.textStyles.smMedium,
            ),
            verticalSpace(12.h),
            AppButton(
              text: context.tr('retry'),
              variant: AppButtonVariant.secondary,
              size: AppButtonSize.sm,
              onPressed: () => context.read<OutcomesBloc>().add(
                const OutcomesEvent.retryRequested(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
