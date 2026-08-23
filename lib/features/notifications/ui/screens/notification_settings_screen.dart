import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/empty_state.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../../../core/widget/shimmer_skeleton.dart';
import '../../data/models/notification_view.dart';
import '../../data/repo/notifications_repository.dart';

/// Notification preferences — four mute switches and the language the
/// server renders notifications in.
///
/// This screen exists now because `PATCH /notifications/preferences` does.
/// The earlier contract had the DTO and the service method but no route
/// calling them, so the screen was deliberately omitted rather than shipped
/// with toggles that did nothing.
///
/// Pops `true` when the language changed, so the inbox knows to discard its
/// cached text and re-fetch.
class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  final _repository = getIt<NotificationsRepository>();

  NotificationPreferencesView? _preferences;
  bool _loading = true;
  String? _error;

  /// Set once a language switch succeeds — the caller has to re-fetch.
  bool _languageChanged = false;

  /// Blocks a second write while one is in flight. Two rapid taps would
  /// otherwise race, and the loser's response would overwrite the winner's
  /// switch positions on screen.
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    final result = await _repository.preferences();
    if (!mounted) return;
    setState(() {
      _loading = false;
      if (result is Success<NotificationPreferencesView>) {
        _preferences = result.data;
      } else if (result is Failure<NotificationPreferencesView>) {
        _error = result.error.message;
      }
    });
  }

  /// Applies one change. Only the changed key travels — the request omits
  /// every null, so an untouched switch is never resent.
  Future<void> _patch(UpdateNotificationPreferencesRequest request) async {
    if (_saving) return;
    setState(() => _saving = true);

    final result = await _repository.updatePreferences(request);
    if (!mounted) return;

    setState(() {
      _saving = false;
      if (result is Success<NotificationPreferencesView>) {
        // The response carries the full object, so the screen adopts the
        // server's view rather than guessing at the outcome.
        _preferences = result.data;
        if (request.language != null) _languageChanged = true;
      }
    });

    if (result is Failure<NotificationPreferencesView>) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            result.error.message ?? context.tr('error_unexpected'),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        // Hands the language result back so the inbox can re-fetch: after a
        // switch, every row's text is different even though its id is not.
        Navigator.of(context).pop(_languageChanged);
      },
      child: Scaffold(
        backgroundColor: colors.page,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 8.h),
                child: Row(
                  children: [
                    PressableScale(
                      onTap: () => Navigator.of(context).pop(_languageChanged),
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
                        context.tr('notification_settings_title'),
                        style: context.textStyles.baseBold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: _buildBody(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (_loading) {
      return AppShimmer(
        child: ListView.builder(
          padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 24.h),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (_, _) => Padding(
            padding: EdgeInsets.only(bottom: 14.h),
            child: SkeletonBox(width: double.infinity, height: 48.h),
          ),
        ),
      );
    }

    if (_preferences == null) {
      return Center(
        child: EmptyState(
          icon: Icons.wifi_off_rounded,
          title: context.tr('error_unexpected'),
          subtitle: _error,
        ),
      );
    }

    final prefs = _preferences!;
    return ListView(
      padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 24.h),
      children: [
        _SectionLabel(context.tr('notification_settings_language')),
        // The one setting with a consequence worth spelling out.
        _LanguageRow(
          value: prefs.language,
          enabled: !_saving,
          onChanged: (language) => _patch(
            UpdateNotificationPreferencesRequest(language: language),
          ),
        ),
        verticalSpace(6.h),
        _Note(context.tr('notification_settings_language_note')),

        verticalSpace(20.h),
        _SectionLabel(context.tr('notification_settings_types')),
        _SwitchRow(
          label: context.tr('notifications_type_security'),
          value: prefs.securityEnabled,
          enabled: !_saving,
          onChanged: (v) => _patch(
            UpdateNotificationPreferencesRequest(securityEnabled: v),
          ),
        ),
        _SwitchRow(
          label: context.tr('notifications_type_system'),
          value: prefs.systemEnabled,
          enabled: !_saving,
          onChanged: (v) =>
              _patch(UpdateNotificationPreferencesRequest(systemEnabled: v)),
        ),
        _SwitchRow(
          label: context.tr('notifications_type_marketing'),
          value: prefs.marketingEnabled,
          enabled: !_saving,
          onChanged: (v) => _patch(
            UpdateNotificationPreferencesRequest(marketingEnabled: v),
          ),
        ),
        verticalSpace(6.h),
        // ⚠️ Muting is checked at *send* time and a muted stream is never
        // stored — no in-app row, no push. Re-enabling back-fills nothing.
        // That is a stronger effect than a "notifications" toggle usually
        // implies, so the screen says it plainly rather than letting a rep
        // discover it by losing a security alert.
        _Note(context.tr('notification_settings_mute_note')),

        verticalSpace(20.h),
        _SectionLabel(context.tr('notification_settings_push')),
        _SwitchRow(
          label: context.tr('notification_settings_push_enabled'),
          value: prefs.pushEnabled,
          enabled: !_saving,
          onChanged: (v) =>
              _patch(UpdateNotificationPreferencesRequest(pushEnabled: v)),
        ),
        verticalSpace(6.h),
        // The narrow one: it suppresses the push only, so the inbox stays
        // complete. Worth distinguishing from the mute switches above.
        _Note(context.tr('notification_settings_push_note')),
      ],
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String label;

  const _SectionLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h, top: 4.h),
      child: Text(label, style: context.textStyles.smBold),
    );
  }
}

class _Note extends StatelessWidget {
  final String text;

  const _Note(this.text);

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.info_outline_rounded, size: 13.sp, color: colors.ink400),
        horizontalSpace(6),
        Expanded(
          child: Text(
            text,
            style: context.textStyles.xsMedium.copyWith(
              color: colors.ink500,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

class _SwitchRow extends StatelessWidget {
  final String label;
  final bool value;
  final bool enabled;
  final ValueChanged<bool> onChanged;

  const _SwitchRow({
    required this.label,
    required this.value,
    required this.enabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(label, style: context.textStyles.smMedium),
          ),
          Switch.adaptive(
            value: value,
            activeTrackColor: colors.brand500,
            onChanged: enabled ? onChanged : null,
          ),
        ],
      ),
    );
  }
}

class _LanguageRow extends StatelessWidget {
  final NotificationLanguage value;
  final bool enabled;
  final ValueChanged<NotificationLanguage> onChanged;

  const _LanguageRow({
    required this.value,
    required this.enabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Row(
        children: [
          for (final option in NotificationLanguage.values)
            Expanded(
              child: PressableScale(
                onTap: enabled && option != value
                    ? () => onChanged(option)
                    : null,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: option == value ? colors.brand500 : null,
                    borderRadius: BorderRadius.circular(AppRadius.field),
                  ),
                  child: Text(
                    context.tr(option.labelKey),
                    style: context.textStyles.smBold.copyWith(
                      color: option == value
                          ? colors.white
                          : colors.textColor,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
