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
import '../../../../core/widget/empty_state.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../../../core/widget/shimmer_skeleton.dart';
import '../../data/models/notification_enums.dart';
import '../../data/models/notification_subtype.dart';
import '../../data/models/notification_view.dart';
import '../../logic/badge_cubit/unread_badge_cubit.dart';
import '../../logic/inbox_bloc/inbox_bloc.dart';
import '../../logic/inbox_bloc/inbox_event.dart';
import '../../logic/inbox_bloc/inbox_state.dart';
import '../widgets/notification_tile.dart';

/// The inbox. Reached from the bell on the Home tab.
///
/// No settings screen is offered from here on purpose: there is **no
/// `PATCH /notifications/preferences`** in the backend — the DTO and the
/// service method exist but no controller route calls them. Toggles that
/// call nothing are worse than no screen, so the read-only preferences
/// endpoint stays unwired until an update route ships.
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => InboxBloc(getIt(), getIt<UnreadBadgeCubit>())
            ..add(const InboxEvent.opened()),
        ),
        // ⚠️ `.value`, never `create:`. The badge is a lazy singleton shared
        // with the bell on the Home tab, and `BlocProvider(create:)` closes
        // whatever it builds when its screen pops — which would leave the
        // bell reading a dead cubit for the rest of the session.
        //
        // It has to be provided at all because this screen reads it through
        // `context` (the app bar's mark-all-read button, the refreshes); the
        // GetIt registration alone puts nothing in the widget tree.
        BlocProvider.value(value: getIt<UnreadBadgeCubit>()),
      ],
      child: const _InboxView(),
    );
  }
}

class _InboxView extends StatefulWidget {
  const _InboxView();

  @override
  State<_InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<_InboxView> {
  final _scrollController = ScrollController();

  /// Which row is expanded. The payload is a title, a two-line message and a
  /// timestamp — a whole screen for that would be mostly empty, so it
  /// expands in place instead.
  String? _expandedId;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    // §9.2 — opening the inbox is one of the events that refreshes the
    // badge, in place of a timer.
    context.read<UnreadBadgeCubit>().refresh();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    // Prefetch at ~70% rather than at the very bottom.
    if (position.pixels >= position.maxScrollExtent * 0.7) {
      context.read<InboxBloc>().add(const InboxEvent.nextPageRequested());
    }
  }

  void _onTapTile(NotificationView notification) {
    final bloc = context.read<InboxBloc>();
    bloc.add(InboxEvent.readRequested(notification.id));
    setState(() {
      _expandedId = _expandedId == notification.id ? null : notification.id;
    });

    // Branch on `metadata`, never on the title — titles are server-rendered
    // in the reader's language, so a string match would break the moment a
    // rep switches to Arabic.
    switch (destinationOf(notification)) {
      case NotificationDestination.project:
        // The settlement loop: an outcome submitted, confirmed or rejected.
        // The project is the useful landing place — the outcome lives inside
        // it and the rep needs the surrounding context either way.
        final projectId = projectIdOf(notification);
        if (projectId != null) {
          context.pushNamed(
            Routes.projectDetailScreen,
            arguments: {'projectId': projectId},
          );
        }
      case NotificationDestination.securityPassword:
        context.pushNamed(Routes.changePasswordScreen);
      case NotificationDestination.securityTwoFactor:
      case NotificationDestination.none:
        // Nowhere to go. `securityTwoFactor` has no screen in this build (a
        // rep is not 2FA-gated), and most rows describe a state rather than
        // pointing at one — they expand inline instead.
        break;
    }
  }

  void _onArchive(NotificationView notification) {
    final bloc = context.read<InboxBloc>();
    bloc.add(InboxEvent.archiveRequested(notification.id));

    // The row is already gone from the list; the DELETE has not been sent.
    // Undo simply cancels the pending request — there is no un-archive
    // route to call, and archive is irreversible once it fires.
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: InboxBloc.undoWindow,
          content: Text(context.tr('notifications_archived')),
          action: SnackBarAction(
            label: context.tr('notifications_undo'),
            onPressed: () =>
                bloc.add(InboxEvent.archiveUndone(notification.id)),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.page,
      body: SafeArea(
        child: Column(
          children: [
            const _InboxAppBar(),
            const _FilterChips(),
            verticalSpace(4.h),
            Expanded(
              child: BlocBuilder<InboxBloc, InboxState>(
                builder: (context, state) => RefreshIndicator(
                  color: colors.brand500,
                  onRefresh: () async {
                    context.read<InboxBloc>().add(
                      const InboxEvent.refreshed(),
                    );
                    await context.read<UnreadBadgeCubit>().refresh();
                  },
                  child: _buildBody(context, state),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, InboxState state) {
    final padding = EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 24.h);

    switch (state.status) {
      case InboxStatus.initial:
      case InboxStatus.loading:
        return _InboxSkeleton(padding: padding);

      case InboxStatus.networkError:
        return ListView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: padding,
          children: [
            verticalSpace(60.h),
            EmptyState(
              icon: Icons.wifi_off_rounded,
              title: context.tr('error_unexpected'),
              subtitle: state.errorMessage,
            ),
            verticalSpace(12.h),
            Center(
              child: PressableScale(
                onTap: () => context.read<InboxBloc>().add(
                  const InboxEvent.refreshed(),
                ),
                child: Text(
                  context.tr('retry'),
                  style: context.textStyles.smBold.copyWith(
                    color: context.colors.brand600,
                  ),
                ),
              ),
            ),
          ],
        );

      case InboxStatus.empty:
        return ListView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: padding,
          children: [
            verticalSpace(60.h),
            // Two distinct empty states: an empty inbox is reassuring, an
            // empty *filter* needs a way back out.
            EmptyState(
              icon: Icons.notifications_none_rounded,
              title: state.isFilteredEmpty
                  ? context.tr('notifications_empty_filtered_title')
                  : context.tr('notifications_empty_title'),
              subtitle: state.isFilteredEmpty
                  ? null
                  : context.tr('notifications_empty_subtitle'),
            ),
            if (state.isFilteredEmpty) ...[
              verticalSpace(12.h),
              Center(
                child: PressableScale(
                  onTap: () => context.read<InboxBloc>().add(
                    const InboxEvent.filterChanged(NotificationFilter.all),
                  ),
                  child: Text(
                    context.tr('notifications_show_all'),
                    style: context.textStyles.smBold.copyWith(
                      color: context.colors.brand600,
                    ),
                  ),
                ),
              ),
            ],
          ],
        );

      case InboxStatus.loaded:
        final groups = _groupByDay(context, state.notifications);
        return ListView.builder(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: padding,
          itemCount: groups.length + (state.isLoadingMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index >= groups.length) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Center(
                  child: SizedBox(
                    width: 22.w,
                    height: 22.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: context.colors.brand500,
                    ),
                  ),
                ),
              );
            }
            final entry = groups[index];
            if (entry.header != null) {
              return Padding(
                padding: EdgeInsets.fromLTRB(4.w, 12.h, 4.w, 6.h),
                child: Text(
                  entry.header!,
                  style: context.textStyles.xsSemibold.copyWith(
                    color: context.colors.ink400,
                  ),
                ),
              );
            }
            final notification = entry.notification!;
            return Dismissible(
              key: ValueKey(notification.id),
              direction: DismissDirection.endToStart,
              background: _ArchiveBackground(),
              onDismissed: (_) => _onArchive(notification),
              child: NotificationTile(
                notification: notification,
                expanded: _expandedId == notification.id,
                onTap: () => _onTapTile(notification),
                onArchive: () => _onArchive(notification),
              ),
            );
          },
        );
    }
  }

  /// There is no `groupKey` on the row, so the day headers are built
  /// client-side from `createdAt`.
  List<_InboxRow> _groupByDay(
    BuildContext context,
    List<NotificationView> notifications,
  ) {
    final rows = <_InboxRow>[];
    String? currentBucket;
    for (final notification in notifications) {
      final bucket = _bucketOf(context, notification.createdAt);
      if (bucket != currentBucket) {
        currentBucket = bucket;
        rows.add(_InboxRow.header(bucket));
      }
      rows.add(_InboxRow.tile(notification));
    }
    return rows;
  }

  String _bucketOf(BuildContext context, DateTime? createdAt) {
    if (createdAt == null) return context.tr('notifications_group_older');
    final now = DateTime.now();
    final local = createdAt.toLocal();
    final startOfToday = DateTime(now.year, now.month, now.day);
    final days = startOfToday.difference(
      DateTime(local.year, local.month, local.day),
    ).inDays;
    if (days <= 0) return context.tr('notifications_group_today');
    if (days == 1) return context.tr('notifications_group_yesterday');
    if (days < 7) return context.tr('notifications_group_this_week');
    return context.tr('notifications_group_older');
  }
}

/// A flattened list entry — either a sticky-ish day header or a tile.
class _InboxRow {
  final String? header;
  final NotificationView? notification;

  const _InboxRow.header(this.header) : notification = null;
  const _InboxRow.tile(this.notification) : header = null;
}

class _InboxAppBar extends StatelessWidget {
  const _InboxAppBar();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 4.h),
      child: Row(
        children: [
          PressableScale(
            onTap: () => context.pop(),
            child: Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(AppRadius.field),
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                size: 18.sp,
                color: colors.textColor,
              ),
            ),
          ),
          horizontalSpace(10),
          Expanded(
            child: Text(
              context.tr('notifications_title'),
              style: context.textStyles.baseBold,
            ),
          ),
          PressableScale(
            onTap: () async {
              final bloc = context.read<InboxBloc>();
              final languageChanged = await context.pushNamed(
                Routes.notificationSettingsScreen,
              );
              if (!context.mounted) return;
              // ⚠️ Mandatory after a language switch. A row is stored as a
              // template key plus its parameters and rendered on the way out
              // in the reader's language, so **every** row's text just
              // changed — including last year's. The ids are stable, which
              // is exactly why nothing on screen would refresh itself.
              if (languageChanged == true) {
                bloc.add(const InboxEvent.refreshed());
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              child: Icon(
                Icons.tune_rounded,
                size: 20.sp,
                color: colors.textColor70,
              ),
            ),
          ),
          // Enabled only when something is actually unread.
          BlocBuilder<UnreadBadgeCubit, int>(
            builder: (context, count) {
              if (count <= 0) return const SizedBox.shrink();
              return PressableScale(
                onTap: () {
                  context.read<InboxBloc>().add(
                    const InboxEvent.readAllRequested(),
                  );
                  // ⚠️ No number in the copy. `read-all` returns a count
                  // that also includes archived rows, so it can exceed what
                  // the rep ever saw — it is never shown.
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(context.tr('notifications_all_read')),
                      ),
                    );
                },
                child: Text(
                  context.tr('notifications_mark_all_read'),
                  style: context.textStyles.xsBold.copyWith(
                    color: colors.brand600,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Exactly three chips — that is the whole live taxonomy. Only `SECURITY`
/// (6 events) and `SYSTEM` (2) are ever emitted; the other five declared
/// types are e-wallet leftovers with no producer, so a seven-way filter bar
/// would advertise categories that can never fill.
class _FilterChips extends StatelessWidget {
  const _FilterChips();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InboxBloc, InboxState>(
      buildWhen: (p, c) => p.filter != c.filter,
      builder: (context, state) => SizedBox(
        height: 36.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          children: [
            for (final filter in NotificationFilter.values) ...[
              _Chip(
                label: context.tr(filter.labelKey),
                selected: state.filter == filter,
                onTap: () => context.read<InboxBloc>().add(
                  InboxEvent.filterChanged(filter),
                ),
              ),
              horizontalSpace(8),
            ],
          ],
        ),
      ),
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
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
        decoration: BoxDecoration(
          color: selected ? colors.brand50 : colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.full),
          border: Border.all(
            color: selected ? colors.brand300 : colors.Color13,
          ),
        ),
        child: Text(
          label,
          style: context.textStyles.xsSemibold.copyWith(
            color: selected ? colors.brand600 : colors.textColor,
          ),
        ),
      ),
    );
  }
}

class _ArchiveBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      alignment: AlignmentDirectional.centerEnd,
      decoration: BoxDecoration(
        color: colors.statusLost.core,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Icon(Icons.delete_outline_rounded, color: colors.white),
    );
  }
}

/// Mirrors the real tile — avatar square plus two text bars — so the swap to
/// content does not jump.
class _InboxSkeleton extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const _InboxSkeleton({required this.padding});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      child: ListView.builder(
        padding: padding,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (_, _) => Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SkeletonBox(width: 40.w, height: 40.w),
              horizontalSpace(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonBox(width: 160.w, height: 12.h),
                    verticalSpace(8.h),
                    SkeletonBox(width: double.infinity, height: 10.h),
                    verticalSpace(6.h),
                    SkeletonBox(width: 200.w, height: 10.h),
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
