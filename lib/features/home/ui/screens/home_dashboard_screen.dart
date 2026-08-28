import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_logo.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../../attainment/ui/widgets/my_attainment_body.dart';
import '../../../notifications/logic/badge_cubit/unread_badge_cubit.dart';

/// Home tab — the rep's own attainment (`GET /attainment/me`).
///
/// This *is* the Home tab, not a card on it: the first thing a rep needs on
/// opening the app is where they stand against their target, and there is
/// no other dashboard to compete with it — pipeline and today's visits
/// belong to subsystem 04 (Project & Funnel), which isn't built yet (see
/// stakeholders.md).
///
/// Because it is a tab root and not a pushed route there is **no back
/// button**: the bottom bar is the way out, and it stays visible. The
/// screen keeps the Home chrome that already existed — the logo and the
/// notification bell, which is still the only way into the inbox.
class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.page,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 4.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLogo(height: 28.h),
                  _NotificationBellButton(
                    onTap: () async {
                      await context.pushNamed(Routes.notificationsScreen);
                      if (!context.mounted) return;
                      // Reconcile on return: rows may have been read or
                      // archived while the inbox was open.
                      getIt<UnreadBadgeCubit>().refresh();
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 4.h, 12.w, 8.h),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      context.tr('attainment_title'),
                      style: context.textStyles.lgBold,
                    ),
                  ),
                  // The pace rule, the status thresholds and why a quarter
                  // can arrive as two rows — the screen has to be able to
                  // explain itself.
                  PressableScale(
                    onTap: () => showAttainmentHelp(context),
                    child: SizedBox(
                      width: 36.w,
                      height: 36.w,
                      child: Icon(
                        Icons.info_outline_rounded,
                        size: 20.sp,
                        color: colors.textColor70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: MyAttainmentBody()),
          ],
        ),
      ),
    );
  }
}

/// Bell icon opening [Routes.notificationsScreen]. A small tinted circle
/// (Card-recipe-adjacent: brand50 bg, radius-full) rather than a bare
/// `Icons.notifications` glyph, matching the rest of the design system's
/// icon treatment (see the Profile screen's avatar/settings icons).
class _NotificationBellButton extends StatelessWidget {
  final VoidCallback onTap;

  const _NotificationBellButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final bell = GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 40.w,
        height: 40.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: colors.brand50,
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        child: Icon(
          Icons.notifications_none_rounded,
          color: colors.brand600,
          size: 20.sp,
        ),
      ),
    );
    return Stack(clipBehavior: Clip.none, children: [bell, const _BellBadge()]);
  }
}

/// The unread count, over the bell.
///
/// Reads the shared [UnreadBadgeCubit] singleton rather than fetching — the
/// badge appears in more than one place and two independent fetches would
/// both spend from the 30-request-per-minute budget to answer the same
/// question, and could still disagree.
class _BellBadge extends StatelessWidget {
  const _BellBadge();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocBuilder<UnreadBadgeCubit, int>(
      bloc: getIt<UnreadBadgeCubit>(),
      builder: (context, count) {
        if (count <= 0) return const SizedBox.shrink();
        return PositionedDirectional(
          top: 0,
          end: 0,
          child: Semantics(
            // §10 — "٤" alone tells a screen-reader user nothing about what
            // the four are.
            label: context
                .tr('notifications_semantics_badge')
                .replaceAll('{count}', '$count'),
            child: Container(
              constraints: BoxConstraints(minWidth: 16.w),
              height: 16.w,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colors.brand500,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(AppRadius.full),
                border: Border.all(color: colors.page, width: 1.5),
              ),
              child: Text(
                // Capped so a long-neglected inbox cannot stretch the bell
                // out of the header.
                count > 99 ? '99+' : '$count',
                style: context.textStyles.xsBold.copyWith(
                  color: colors.white,
                  fontSize: 9.sp,
                  height: 1.1,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
