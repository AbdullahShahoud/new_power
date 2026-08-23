import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/notification_enums.dart';
import '../../data/models/notification_subtype.dart';
import '../../data/models/notification_view.dart';
import 'relative_time.dart';

/// One row of the inbox.
///
/// Everything visual here is **derived client-side**: the row carries no
/// `priority`, `severity`, `iconName`, `imageUrl`, `actionUrl`, `category`
/// or `groupKey` — the model is exactly `id, type, status, title, message,
/// metadata, readAt, createdAt`. So the glyph, the colour and whether a
/// chevron appears all come from [resolveSubType].
class NotificationTile extends StatelessWidget {
  final NotificationView notification;
  final bool expanded;
  final VoidCallback onTap;
  final VoidCallback onArchive;

  const NotificationTile({
    super.key,
    required this.notification,
    required this.expanded,
    required this.onTap,
    required this.onArchive,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final subType = resolveSubType(notification);
    final severity = subType.severity;
    final accent = _severityColor(context, severity);
    final unread = notification.isUnread;

    // Server text, always. A row is stored as a template key plus its
    // parameters and rendered on the way out in the reader's own language,
    // so this string is already localised — and already carries names,
    // codes and figures the client never receives.
    final title = notification.title;
    final body = notification.message;

    final created = notification.createdAt;
    final relative = created == null
        ? ''
        : RelativeTime.format(context, created);

    return Semantics(
      // §10: unread state and an absolute time both have to be spoken —
      // "منذ ٣ ساعات" alone leaves a blind user unable to know when.
      label: [
        if (unread) context.tr('notifications_semantics_unread'),
        title,
        if (created != null)
          RelativeTime.absoluteForSemantics(context, created),
      ].join('، '),
      button: true,
      child: InkWell(
        onTap: onTap,
        // §10 — swipe alone is not accessible, so archiving also has a
        // long-press route.
        onLongPress: onArchive,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: Container(
          margin: EdgeInsets.only(bottom: 8.h),
          decoration: BoxDecoration(
            color: unread ? colors.brand50.withValues(alpha: 0.4) : null,
            borderRadius: BorderRadius.circular(AppRadius.card),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Critical rows get one extra treatment and nothing more.
                // "Account Suspended" already ends the session in practice;
                // a banner or a blocking dialog on top of that adds noise,
                // not information.
                if (severity == NotificationSeverity.critical)
                  Container(width: 3.w, color: colors.statusLost.core),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (unread) ...[
                          Padding(
                            padding: EdgeInsets.only(top: 6.h),
                            child: Container(
                              width: 8.w,
                              height: 8.w,
                              decoration: BoxDecoration(
                                color: colors.brand500,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          horizontalSpace(8),
                        ],
                        _TypeAvatar(subType: subType, accent: accent),
                        horizontalSpace(10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _AutoDirection(
                                enabled: true,
                                child: Text(
                                  title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.textStyles.smBold,
                                ),
                              ),
                              verticalSpace(3.h),
                              _AutoDirection(
                                enabled: true,
                                child: AnimatedSize(
                                  duration: const Duration(milliseconds: 220),
                                  curve: Curves.easeOutCubic,
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text(
                                    body,
                                    // Collapsed to two lines so the list
                                    // does not go ragged; tapping expands.
                                    maxLines: expanded ? null : 2,
                                    overflow: expanded
                                        ? TextOverflow.visible
                                        : TextOverflow.ellipsis,
                                    style: context.textStyles.xsMedium
                                        .copyWith(height: 1.5),
                                  ),
                                ),
                              ),
                              if (expanded &&
                                  showsLoggedOutOtherSessions(notification))
                                Padding(
                                  padding: EdgeInsets.only(top: 8.h),
                                  child: _MetadataNote(
                                    label: context.tr(
                                      'notification_meta_logged_out_others',
                                    ),
                                  ),
                                ),
                              verticalSpace(6.h),
                              Row(
                                children: [
                                  Text(
                                    relative,
                                    style: context.textStyles.xsMedium
                                        .copyWith(
                                          color: colors.ink400,
                                          fontSize: 10.sp,
                                        ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    context.tr(notification.type.labelKey),
                                    style: context.textStyles.xsSemibold
                                        .copyWith(
                                          color: colors.ink400,
                                          fontSize: 10.sp,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // A chevron only where tapping actually goes
                        // somewhere. Of the eight events a rep receives,
                        // only password and 2FA have a destination — the
                        // rest describe a state and point nowhere.
                        if (destinationOf(notification) != NotificationDestination.none)
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Icon(
                              Icons.chevron_right_rounded,
                              size: 18.sp,
                              color: colors.ink400,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _severityColor(BuildContext context, NotificationSeverity severity) {
    final colors = context.colors;
    return switch (severity) {
      NotificationSeverity.critical => colors.statusLost.core,
      NotificationSeverity.warning => colors.statusFollowUp.core,
      NotificationSeverity.positive => colors.statusWon.core,
      NotificationSeverity.neutral => colors.statusNew.core,
    };
  }
}

/// The derived glyph. Never a photo — there is no image field on the model.
class _TypeAvatar extends StatelessWidget {
  final NotificationSubType subType;
  final Color accent;

  const _TypeAvatar({required this.subType, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppRadius.field),
      ),
      child: Icon(_glyph, size: 20.sp, color: accent),
    );
  }

  /// §4.2's table. Severity is never carried by colour alone — each row
  /// gets a distinct glyph too, so the meaning survives for a colour-blind
  /// rep.
  IconData get _glyph => switch (subType) {
    NotificationSubType.accountSuspended => Icons.gpp_maybe_outlined,
    NotificationSubType.accountBanned => Icons.gpp_bad_outlined,
    NotificationSubType.adminPasswordReset => Icons.key_off_outlined,
    NotificationSubType.passwordReset => Icons.vpn_key_outlined,
    NotificationSubType.passwordChanged => Icons.vpn_key_outlined,
    NotificationSubType.twoFactorEnabled => Icons.verified_user_outlined,
    NotificationSubType.accountReactivated => Icons.gpp_good_outlined,
    NotificationSubType.accountApproved => Icons.verified_outlined,
    NotificationSubType.repPendingApproval => Icons.person_search_outlined,
    NotificationSubType.broadcast => Icons.campaign_outlined,
  };
}

/// The one `metadata` fact worth showing a rep. Everything else in there is
/// a raw uuid, a duplicate of `createdAt`, or already implied by the body.
class _MetadataNote extends StatelessWidget {
  final String label;

  const _MetadataNote({required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: [
        Icon(Icons.info_outline_rounded, size: 13.sp, color: colors.ink400),
        horizontalSpace(6),
        Expanded(
          child: Text(
            label,
            style: context.textStyles.xsMedium.copyWith(
              color: colors.ink500,
              fontSize: 10.sp,
            ),
          ),
        ),
      ],
    );
  }
}

/// Resolves direction from the first strong character.
///
/// Only broadcasts need this: an admin may type them in English or Arabic,
/// and an English broadcast inside an RTL list renders right-aligned with
/// its punctuation at the wrong end. Mapped notifications are always Arabic
/// and inherit the sheet's direction unchanged.
class _AutoDirection extends StatelessWidget {
  final bool enabled;
  final Widget child;

  const _AutoDirection({required this.enabled, required this.child});

  @override
  Widget build(BuildContext context) {
    if (!enabled) return child;
    return Builder(
      builder: (context) {
        final text = _firstText(child);
        final direction = _resolve(text);
        if (direction == null) return child;
        return Directionality(textDirection: direction, child: child);
      },
    );
  }

  static String _firstText(Widget widget) {
    if (widget is Text) return widget.data ?? '';
    return '';
  }

  /// `null` when the string has no strong character either way (digits,
  /// punctuation) — then the ambient direction is the better guess.
  static TextDirection? _resolve(String value) {
    for (final rune in value.runes) {
      // Arabic, Arabic Supplement/Extended, and the Arabic Presentation
      // Forms blocks — enough to classify any realistic broadcast.
      if ((rune >= 0x0600 && rune <= 0x08FF) ||
          (rune >= 0xFB50 && rune <= 0xFEFF)) {
        return TextDirection.rtl;
      }
      if ((rune >= 0x0041 && rune <= 0x005A) ||
          (rune >= 0x0061 && rune <= 0x007A)) {
        return TextDirection.ltr;
      }
    }
    return null;
  }
}
