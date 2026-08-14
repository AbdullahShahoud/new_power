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
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_header.dart';
import '../../../../core/widget/empty_state.dart';
import '../../data/models/enums.dart';
import '../../data/models/queued_activity_record.dart';
import '../../logic/offline_sync_bloc/offline_sync_bloc.dart';
import '../../logic/offline_sync_bloc/offline_sync_event.dart';
import '../../logic/offline_sync_bloc/offline_sync_state.dart';
import '../widgets/project_enum_labels.dart';

/// Phase 4 — the local activity queue (§10 Workflow 5). Reads the same
/// singleton `OfflineSyncBloc` instance that `log_activity_screen.dart`
/// feeds and `main.dart`'s connectivity listener drains, so this screen is
/// purely a viewer/manual-trigger on shared state, not its own data owner.
class OfflineQueueScreen extends StatelessWidget {
  const OfflineQueueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<OfflineSyncBloc>(),
      child: const _OfflineQueueView(),
    );
  }
}

class _OfflineQueueView extends StatelessWidget {
  const _OfflineQueueView();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocListener<OfflineSyncBloc, OfflineSyncState>(
      listenWhen: (previous, current) =>
          previous.syncStatus != current.syncStatus,
      listener: (context, state) {
        switch (state.syncStatus) {
          case OfflineSyncStatus.success:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  context.tr(
                    'offline_queue_sync_success',
                  ).replaceAll('{count}', '${state.lastSyncCreated ?? 0}'),
                ),
              ),
            );
          case OfflineSyncStatus.offline:
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(context.tr('offline_queue_sync_failed'))),
            );
          case OfflineSyncStatus.idle:
          case OfflineSyncStatus.syncing:
          case OfflineSyncStatus.networkError:
            break;
        }
      },
      child: Scaffold(
        backgroundColor: colors.page,
        body: SafeArea(
          child: Column(
            children: [
              AppHeader(title: context.tr('offline_queue_title')),
              Expanded(
                child: BlocBuilder<OfflineSyncBloc, OfflineSyncState>(
                  builder: (context, state) {
                    if (state.queueStatus == OfflineQueueStatus.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state.queuedItems.isEmpty) {
                      return EmptyState(
                        icon: Icons.cloud_done_outlined,
                        title: context.tr('offline_queue_empty_title'),
                        subtitle: context.tr('offline_queue_empty_subtitle'),
                      );
                    }
                    final syncing =
                        state.syncStatus == OfflineSyncStatus.syncing;
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 12.h),
                          child: AppButton(
                            text: context.tr('offline_queue_sync_now'),
                            isLoading: syncing,
                            onPressed: syncing
                                ? null
                                : () => context.read<OfflineSyncBloc>().add(
                                    const OfflineSyncEvent.syncRequested(),
                                  ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.fromLTRB(
                              20.w,
                              0,
                              20.w,
                              24.h,
                            ),
                            itemCount: state.queuedItems.length,
                            itemBuilder: (context, index) {
                              return _QueuedActivityCard(
                                record: state.queuedItems[index],
                                onDiscard: () => context
                                    .read<OfflineSyncBloc>()
                                    .add(
                                      OfflineSyncEvent.itemDiscarded(
                                        state.queuedItems[index].item.clientRef,
                                      ),
                                    ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QueuedActivityCard extends StatelessWidget {
  final QueuedActivityRecord record;
  final VoidCallback onDiscard;
  const _QueuedActivityCard({required this.record, required this.onDiscard});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final item = record.item;
    final hasError = record.lastErrorMessage != null;
    return Container(
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
              Icon(
                item.kind == ActivityKind.visit
                    ? Icons.location_on_outlined
                    : Icons.call_outlined,
                size: 16.sp,
                color: colors.brand500,
              ),
              horizontalSpace(6),
              Expanded(
                child: Text(
                  context.tr(item.purpose.labelKey),
                  style: context.textStyles.smBold,
                ),
              ),
              GestureDetector(
                onTap: onDiscard,
                child: Icon(
                  Icons.close_rounded,
                  size: 18.sp,
                  color: colors.textColor70,
                ),
              ),
            ],
          ),
          verticalSpace(4.h),
          Text(
            item.notes,
            style: context.textStyles.xsMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(6.h),
          Text(
            record.queuedAt.toLocal().toString(),
            style: context.textStyles.xsMedium.copyWith(
              color: colors.textColor70,
            ),
          ),
          if (hasError) ...[
            verticalSpace(8.h),
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: colors.statusLost.badgeBg,
                borderRadius: BorderRadius.circular(AppRadius.field),
              ),
              child: Text(
                record.lastErrorMessage!,
                style: context.textStyles.xsMedium.copyWith(
                  color: colors.statusLost.badgeText,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
