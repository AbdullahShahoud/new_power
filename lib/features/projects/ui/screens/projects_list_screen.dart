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
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_text_field.dart';
import '../../../../core/widget/empty_state.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../../../core/widget/shimmer_skeleton.dart';
import '../../data/models/enums.dart';
import '../../logic/projects_bloc/projects_bloc.dart';
import '../../logic/projects_bloc/projects_event.dart';
import '../../logic/projects_bloc/projects_state.dart';
import '../widgets/project_card.dart';
import '../widgets/project_enum_labels.dart';

/// Replaces the old tab placeholder (`home/ui/screens/projects_screen.dart`)
/// — `GET /projects` list rows, filter chips, search, pull-to-refresh,
/// infinite scroll, tap → detail, FAB → register.
class ProjectsListScreen extends StatelessWidget {
  const ProjectsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ProjectsBloc>()..add(const ProjectsEvent.listRequested()),
      child: const _ProjectsListView(),
    );
  }
}

class _ProjectsListView extends StatefulWidget {
  const _ProjectsListView();

  @override
  State<_ProjectsListView> createState() => _ProjectsListViewState();
}

class _ProjectsListViewState extends State<_ProjectsListView> {
  /// Fires the refresh and waits for it to settle so the spinner retracts at
  /// the right moment.
  ///
  /// The timeout is the load-bearing part. `firstWhere` waits for a *new*
  /// state, and Bloc silently drops an `emit` whose state equals the current
  /// one — so a refresh that returns byte-identical data (the common case
  /// when a rep pulls twice in a row) emits nothing, and the await never
  /// completes. The spinner then hangs on screen forever, which reads as
  /// "refresh is broken" even though the request succeeded.
  Future<void> _refreshList(BuildContext context) async {
    final bloc = context.read<ProjectsBloc>();
    bloc.add(const ProjectsEvent.listRefreshed());
    await bloc.stream
        .firstWhere((s) => s.listStatus != PagedFeedStatus.refreshing)
        .timeout(const Duration(seconds: 15), onTimeout: () => bloc.state);
  }

  final _searchController = TextEditingController();
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
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<ProjectsBloc>().add(const ProjectsEvent.nextPageRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.page,
      // §5 Primary button recipe (brand-500 bg, white text, rounded-full)
      // adapted as a floating action button — not Material's default FAB
      // styling, which doesn't follow the documented button recipe.
      // Extra bottom padding clears `main_screen.dart`'s floating pill nav
      // bar (64.h tall + 12.h gap) — that bar lives on the *outer* Scaffold
      // (`extendBody: true`), so this inner Scaffold's own FAB positioning
      // has no way to know about it and would otherwise sit half-hidden
      // behind it.
      // `startFloat` is direction-aware: bottom-left in LTR, bottom-right in
      // RTL — Flutter mirrors it from the ambient Directionality, so the
      // button lands on the natural "primary action" side in both locales
      // without a manual locale check.
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 80.h),
        child: FloatingActionButton.extended(
          // Awaited, then refreshed: registration pushes straight on to the
          // new project's detail screen, so this future only completes once
          // the rep pops all the way back here — at which point the list is
          // stale and missing the building they just registered.
          onPressed: () async {
            await context.pushNamed(Routes.registerProjectScreen);
            if (!context.mounted) return;
            context.read<ProjectsBloc>().add(
              const ProjectsEvent.listRefreshed(),
            );
          },
          backgroundColor: colors.brand500,
          foregroundColor: colors.white,
          shape: const StadiumBorder(),
          // Trimmed down from the default extended-FAB metrics: the stock
          // 48dp height and 20px padding read oversized next to this app's
          // `sm` button scale (h-8/h-10).
          extendedPadding: EdgeInsets.symmetric(horizontal: 10.w),
          extendedIconLabelSpacing: 4.w,
          elevation: 2,
          icon: Icon(Icons.add, size: 18.sp),
          label: Text(
            context.tr('projects_register_cta'),
            style: context.textStyles.xsBold.copyWith(color: colors.white),
          ),
        ),
      ),
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
            verticalSpace(12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: AppTextField(
                hintText: context.tr('projects_search_hint'),
                controller: _searchController,
                prefixIcon: Icon(Icons.search, color: colors.textColor70),
                onChanged: (value) => context.read<ProjectsBloc>().add(
                  ProjectsEvent.searchChanged(value),
                ),
              ),
            ),
            verticalSpace(10.h),
            const _StageFilterChips(),
            verticalSpace(8.h),
            Expanded(
              child: BlocBuilder<ProjectsBloc, ProjectsState>(
                builder: (context, state) {
                  return switch (state.listStatus) {
                    PagedFeedStatus.initial ||
                    PagedFeedStatus.loading => const _ProjectsListSkeleton(),
                    // Both of these used to render a bare, unscrollable
                    // widget — so on exactly the two screens where a rep
                    // most wants to pull down (nothing here yet, or the
                    // load failed) there was nothing to pull.
                    PagedFeedStatus.networkError => _PullToRefresh(
                      onRefresh: () => _refreshList(context),
                      child: _ListError(message: state.listErrorMessage),
                    ),
                    PagedFeedStatus.empty => _PullToRefresh(
                      onRefresh: () => _refreshList(context),
                      child: EmptyState(
                        icon: Icons.apartment_rounded,
                        title: context.tr('projects_empty_title'),
                        subtitle: context.tr('projects_empty_subtitle'),
                      ),
                    ),
                    PagedFeedStatus.loaded ||
                    PagedFeedStatus.paginationLoading ||
                    PagedFeedStatus.refreshing => RefreshIndicator(
                      onRefresh: () => _refreshList(context),
                      child: ListView.builder(
                        controller: _scrollController,
                        // `RefreshIndicator` needs a scrollable that can
                        // overscroll even when the list is too short to
                        // fill the viewport (a handful of projects, or the
                        // empty-minus-one-item case) — without this, a
                        // short list simply can't be dragged, so pull-to-
                        // refresh silently does nothing.
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 100.h),
                        itemCount:
                            state.projects.length +
                            (state.listStatus ==
                                    PagedFeedStatus.paginationLoading
                                ? 1
                                : 0),
                        itemBuilder: (context, index) {
                          if (index >= state.projects.length) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                          final project = state.projects[index];
                          return ProjectCard(
                            project: project,
                            onTap: () => context.pushNamed(
                              Routes.projectDetailScreen,
                              arguments: {'projectId': project.id},
                            ),
                          );
                        },
                      ),
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

class _StageFilterChips extends StatelessWidget {
  const _StageFilterChips();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsBloc, ProjectsState>(
      buildWhen: (previous, current) =>
          previous.filter.stage != current.filter.stage,
      builder: (context, state) {
        final selectedStage = state.filter.stage;
        return SizedBox(
          height: 34.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            children: [
              _FilterChip(
                label: context.tr('projects_filter_all'),
                selected: selectedStage == null,
                onTap: () => context.read<ProjectsBloc>().add(
                  ProjectsEvent.filterChanged(
                    state.filter.copyWith(stage: null),
                  ),
                ),
              ),
              for (final stage in openProjectStages) ...[
                horizontalSpace(8),
                _FilterChip(
                  label: context.tr(stage.labelKey),
                  selected: selectedStage == stage,
                  onTap: () => context.read<ProjectsBloc>().add(
                    ProjectsEvent.filterChanged(
                      state.filter.copyWith(
                        stage: selectedStage == stage ? null : stage,
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

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _FilterChip({
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
          border: Border.all(color: selected ? colors.brand500 : colors.ink200),
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
              context.tr('projects_list_error'),
              textAlign: TextAlign.center,
              style: context.textStyles.smMedium,
            ),
            verticalSpace(12.h),
            AppButton(
              text: context.tr('retry'),
              variant: AppButtonVariant.secondary,
              size: AppButtonSize.sm,
              onPressed: () => context.read<ProjectsBloc>().add(
                const ProjectsEvent.retryRequested(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Shape-matches `ProjectCard` (name+badge row, subtitle row, footer row)
/// so the loading state doesn't visually "jump" once real cards arrive.
class _ProjectsListSkeleton extends StatelessWidget {
  const _ProjectsListSkeleton();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return AppShimmer(
      child: ListView.builder(
        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 100.h),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(bottom: 12.h),
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(AppRadius.card),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SkeletonBox(width: 140.w, height: 14.h),
                    const Spacer(),
                    SkeletonBox(
                      width: 60.w,
                      height: 20.h,
                      radius: AppRadius.full,
                    ),
                  ],
                ),
                verticalSpace(10.h),
                SkeletonBox(width: 100.w, height: 11.h),
                verticalSpace(14.h),
                Row(
                  children: [
                    SkeletonBox(
                      width: 70.w,
                      height: 18.h,
                      radius: AppRadius.full,
                    ),
                    const Spacer(),
                    SkeletonBox(width: 60.w, height: 11.h),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/// Makes a non-scrolling widget (an empty state, an error panel) pullable.
///
/// A `RefreshIndicator` only responds to overscroll from a real scrollable,
/// so a centred `EmptyState` on its own cannot be pulled at all. Wrapping it
/// in a viewport-filling scroll view with `AlwaysScrollableScrollPhysics`
/// gives it something to overscroll while keeping it vertically centred.
class _PullToRefresh extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget child;

  const _PullToRefresh({required this.onRefresh, required this.child});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
