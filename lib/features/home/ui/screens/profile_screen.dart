import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/feature_flags.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/localization/language_manager.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/services/auth_service.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/theming/theme_notifier.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/app_dialog.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../auth/data/repo/auth_repository.dart';
import '../../../projects/logic/offline_sync_bloc/offline_sync_bloc.dart';
import '../../../projects/logic/offline_sync_bloc/offline_sync_state.dart';

/// Profile tab — current user (`GET /auth/me`) plus logout. Was the whole of
/// `home_placeholder_screen.dart` before the tabbed shell landed; folded in
/// here since "who am I / sign out" is a profile concern.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? _user;
  String? _error;
  bool _loading = true;
  bool _loggingOut = false;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    final result = await getIt<AuthRepository>().getCurrentUser();
    if (!mounted) return;
    result.when(
      success: (response) {
        setState(() {
          _user = response.data;
          _loading = false;
        });
      },
      failure: (error) {
        setState(() {
          _error = error.message ?? 'Failed to load profile';
          _loading = false;
        });
      },
    );
  }

  Future<void> _logout() async {
    // Logging out is cheap to confirm and expensive to undo: signing back in
    // means the password, and on a new device an OTP as well. A rep reaching
    // for something else on a crowded Profile screen should not lose their
    // session to a mis-tap.
    final confirmed = await AppDialog.show<bool>(
      context: context,
      title: context.tr('logout'),
      message: context.tr('logout_confirm'),
      actions: [
        AppDialogButton.secondary(
          label: context.tr('cancel'),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        AppDialogButton.primary(
          label: context.tr('logout'),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
    // Dismissing the dialog is not consent, so anything but an explicit
    // "yes" leaves the session alone.
    if (confirmed != true || !mounted) return;

    setState(() => _loggingOut = true);
    await getIt<AuthService>().logout();
    if (!mounted) return;
    context.pushNamedAndRemoveUntil(
      Routes.loginScreen,
      predicate: (_) => false,
    );
  }

  String _initials(UserModel user) {
    final f = user.firstName.isNotEmpty ? user.firstName[0] : '';
    final l = user.lastName.isNotEmpty ? user.lastName[0] : '';
    return (f + l).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.page,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
              child: Text(
                context.tr('profile'),
                style: context.textStyles.lgBold,
              ),
            ),
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      padding: EdgeInsets.all(20.w),
                      child: _error != null
                          ? _ErrorCard(message: _error!, onRetry: _loadUser)
                          : _user == null
                          ? const SizedBox.shrink()
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                _ProfileCard(
                                  user: _user!,
                                  initials: _initials(_user!),
                                ),
                                verticalSpace(16.h),
                                _AccountSettingsCard(
                                  user: _user!,
                                  onUsernameChanged: (username) => setState(
                                    () => _user = _user!.copyWith(
                                      username: username,
                                      // The one-time change is now spent —
                                      // stamp it locally so the row hides
                                      // immediately, without re-fetching
                                      // `GET /auth/me` just to learn that.
                                      usernameChangedAt: DateTime.now(),
                                    ),
                                  ),
                                ),
                                verticalSpace(16.h),
                                const _OutcomesLinkCard(),
                                verticalSpace(16.h),
                                // Suspended — see
                                // `FeatureFlags.offlineSyncEnabled`.
                                if (FeatureFlags.offlineSyncEnabled) ...[
                                  const _OfflineQueueLinkCard(),
                                  verticalSpace(16.h),
                                ],
                                const _SettingsCard(),
                                verticalSpace(24.h),
                                AppButton(
                                  text: context.tr('logout'),
                                  variant: AppButtonVariant.primary,
                                  isLoading: _loggingOut,
                                  onPressed: _loggingOut ? null : _logout,
                                ),
                              ],
                            ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  final UserModel user;
  final String initials;

  const _ProfileCard({required this.user, required this.initials});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        children: [
          Container(
            width: 64.w,
            height: 64.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: colors.brand50,
              borderRadius: BorderRadius.circular(AppRadius.full),
            ),
            child: Text(
              initials,
              style: context.textStyles.xl2Semibold.copyWith(
                color: colors.brand600,
              ),
            ),
          ),
          verticalSpace(12.h),
          Text(
            '${user.firstName} ${user.lastName}',
            style: context.textStyles.baseBold,
          ),
          verticalSpace(4.h),
          Text(user.email, style: context.textStyles.smRegular),
          if (user.role != null || user.status != null) ...[
            verticalSpace(12.h),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.w,
              runSpacing: 8.h,
              children: [
                if (user.role != null)
                  _Badge(label: _roleLabel(context, user.role!)),
                if (user.status != null)
                  _Badge(label: user.status!, isStatus: true),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// Maps the raw `role` from `GET /auth/me` (e.g. `REPRESENTATIVE`) to a
/// localized display label. Falls back to the raw value for any role the
/// app doesn't have a translation for yet, rather than hiding it.
String _roleLabel(BuildContext context, String role) {
  switch (role.toUpperCase()) {
    case 'REPRESENTATIVE':
      return context.tr('role_representative');
    case 'SALES_MANAGER':
      return context.tr('role_sales_manager');
    case 'SALES_ADMIN':
      return context.tr('role_sales_admin');
    case 'GENERAL_MANAGER':
      return context.tr('role_general_manager');
    default:
      return role;
  }
}

/// Phase 3 entry point — `GET /outcomes`, scoped server-side to "my
/// outcomes" for a rep. Same card recipe as [_SettingsCard] below it.
class _OutcomesLinkCard extends StatelessWidget {
  const _OutcomesLinkCard();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: () => context.pushNamed(Routes.outcomesListScreen),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          boxShadow: AppShadows.card,
        ),
        child: SizedBox(
          height: 56.h,
          child: Row(
            children: [
              Icon(Icons.flag_outlined, size: 20.sp, color: colors.ink600),
              horizontalSpace(12.w),
              Expanded(
                child: Text(
                  context.tr('profile_my_outcomes'),
                  style: context.textStyles.smMedium,
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                size: 20.sp,
                color: colors.ink400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// users.md self-service — change password, and the one-time username
/// change.
///
/// **There is no first/last-name change anywhere in the API.** `users.md`
/// only accepts `firstName`/`lastName` on `POST /admin/users` (provisioning,
/// `GENERAL_MANAGER`-only); no self-service route edits them. So the only
/// "name" a rep can change is their username — offered once, permanently.
class _AccountSettingsCard extends StatelessWidget {
  final UserModel user;
  final ValueChanged<String> onUsernameChanged;

  const _AccountSettingsCard({
    required this.user,
    required this.onUsernameChanged,
  });

  /// users.md: "Check `usernameChangedAt` on `GET /auth/me` before offering
  /// the option." Hiding a spent action beats letting a rep fill in a form
  /// only to be told it was never available.
  bool get _canChangeUsername => user.usernameChangedAt == null;

  Future<void> _openUsername(BuildContext context) async {
    final result = await context.pushNamed(
      Routes.changeUsernameScreen,
      arguments: {'currentUsername': user.username},
    );
    if (result is String) onUsernameChanged(result);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        children: [
          if (_canChangeUsername) ...[
            _ActionRow(
              icon: Icons.alternate_email_rounded,
              label: context.tr('change_username_title'),
              onTap: () => _openUsername(context),
            ),
            Divider(height: 1, color: colors.ink200),
          ],
          _ActionRow(
            icon: Icons.lock_outline_rounded,
            label: context.tr('change_password_title'),
            onTap: () => context.pushNamed(Routes.changePasswordScreen),
          ),
        ],
      ),
    );
  }
}

/// A tappable settings row — same 56dp metric and layout as [_SettingsRow],
/// but with a chevron and a tap target instead of a trailing control.
class _ActionRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionRow({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      child: SizedBox(
        height: 56.h,
        child: Row(
          children: [
            Icon(icon, size: 20.sp, color: colors.ink600),
            horizontalSpace(12.w),
            Expanded(
              child: Text(label, style: context.textStyles.smMedium),
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 20.sp,
              color: colors.ink400,
            ),
          ],
        ),
      ),
    );
  }
}

/// Phase 4 entry point — the local activity queue (§10 Workflow 5). Reads
/// the app-wide `OfflineSyncBloc` singleton directly (not via `BlocProvider`
/// — it isn't scoped to this screen) purely to show a live pending-count
/// badge; `OfflineQueueScreen` itself owns the full view.
class _OfflineQueueLinkCard extends StatelessWidget {
  const _OfflineQueueLinkCard();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return BlocBuilder<OfflineSyncBloc, OfflineSyncState>(
      bloc: getIt<OfflineSyncBloc>(),
      buildWhen: (previous, current) =>
          previous.queuedItems.length != current.queuedItems.length,
      builder: (context, state) {
        final count = state.queuedItems.length;
        return PressableScale(
          onTap: () => context.pushNamed(Routes.offlineQueueScreen),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(AppRadius.card),
              boxShadow: AppShadows.card,
            ),
            child: SizedBox(
              height: 56.h,
              child: Row(
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    size: 20.sp,
                    color: colors.ink600,
                  ),
                  horizontalSpace(12.w),
                  Expanded(
                    child: Text(
                      context.tr('profile_offline_queue'),
                      style: context.textStyles.smMedium,
                    ),
                  ),
                  if (count > 0) ...[
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: colors.statusFollowUp.badgeBg,
                        borderRadius: BorderRadius.circular(AppRadius.full),
                      ),
                      child: Text(
                        '$count',
                        style: context.textStyles.xsSemibold.copyWith(
                          color: colors.statusFollowUp.badgeText,
                        ),
                      ),
                    ),
                    horizontalSpace(8),
                  ],
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 20.sp,
                    color: colors.ink400,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Settings section: language picker (dropdown) + theme switch (with an
/// icon that swaps light/dark as the theme changes). Card recipe (§5).
class _SettingsCard extends StatelessWidget {
  const _SettingsCard();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        children: [
          _SettingsRow(
            leading: Icon(
              Icons.language_rounded,
              size: 20.sp,
              color: colors.ink600,
            ),
            label: context.tr('language'),
            trailing: const _LanguageDropdown(),
          ),
          Divider(height: 1, color: colors.ink200),
          _SettingsRow(
            leading: const _ThemeIcon(),
            label: context.tr('theme'),
            trailing: const _ThemeSwitch(),
          ),
        ],
      ),
    );
  }
}

class _SettingsRow extends StatelessWidget {
  final Widget leading;
  final String label;
  final Widget trailing;

  const _SettingsRow({
    required this.leading,
    required this.label,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      child: Row(
        children: [
          leading,
          horizontalSpace(12.w),
          Expanded(child: Text(label, style: context.textStyles.smMedium)),
          trailing,
        ],
      ),
    );
  }
}

/// Sun/moon icon that swaps — with a cross-fade + rotation — as
/// [ThemeNotifier]'s mode changes. "أيقونة تتغير وفق تغير الثيم".
class _ThemeIcon extends StatelessWidget {
  const _ThemeIcon();

  @override
  Widget build(BuildContext context) {
    final themeNotifier = getIt<ThemeNotifier>();
    final colors = context.colors;
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, mode, _) {
        final isDark = themeNotifier.isDarkMode;
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          transitionBuilder: (child, animation) => RotationTransition(
            turns: animation,
            child: FadeTransition(opacity: animation, child: child),
          ),
          child: Icon(
            isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
            key: ValueKey(isDark),
            size: 20.sp,
            color: isDark ? colors.ink600 : colors.warning,
          ),
        );
      },
    );
  }
}

/// Dropdown listing every supported [AppLanguage] (flag + name), bound to
/// [LanguageManager].
class _LanguageDropdown extends StatelessWidget {
  const _LanguageDropdown();

  @override
  Widget build(BuildContext context) {
    final languageManager = getIt<LanguageManager>();
    return ValueListenableBuilder<Locale>(
      valueListenable: languageManager,
      builder: (context, locale, _) {
        final current = AppLanguage.values.firstWhere(
          (l) => l.code == locale.languageCode,
          orElse: () => AppLanguage.arabic,
        );
        return DropdownButtonHideUnderline(
          child: DropdownButton<AppLanguage>(
            value: current,
            borderRadius: BorderRadius.circular(AppRadius.field),
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: context.colors.ink500,
              size: 20.sp,
            ),
            items: [
              for (final language in AppLanguage.values)
                DropdownMenuItem(
                  value: language,
                  child: Text(
                    '${language.flagEmoji} ${language.name}',
                    style: context.textStyles.smMedium,
                  ),
                ),
            ],
            onChanged: (language) {
              if (language != null) {
                languageManager.setLanguage(language.code);
              }
            },
          ),
        );
      },
    );
  }
}

/// Light/dark toggle bound to [ThemeNotifier] — the leading icon in
/// [_SettingsRow] above it animates between sun/moon as the theme flips.
class _ThemeSwitch extends StatelessWidget {
  const _ThemeSwitch();

  @override
  Widget build(BuildContext context) {
    final themeNotifier = getIt<ThemeNotifier>();
    final colors = context.colors;
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, mode, _) {
        final isDark = themeNotifier.isDarkMode;
        return Switch(
          value: isDark,
          activeTrackColor: colors.brand500,
          onChanged: (value) {
            if (value) {
              themeNotifier.setDarkMode();
            } else {
              themeNotifier.setLightMode();
            }
          },
        );
      },
    );
  }
}

/// Status badge recipe (§5): `rounded-full px-2.5 py-0.5 text-xs font-semibold`,
/// tinted bg + darkened text.
class _Badge extends StatelessWidget {
  final String label;
  final bool isStatus;

  const _Badge({required this.label, this.isStatus = false});

  @override
  Widget build(BuildContext context) {
    final status = isStatus
        ? context.colors.statusWon
        : context.colors.statusNew;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: status.badgeBg,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Text(
        label,
        style: context.textStyles.xsSemibold.copyWith(color: status.badgeText),
      ),
    );
  }
}

class _ErrorCard extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorCard({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        children: [
          Text(
            message,
            style: context.textStyles.smRegular.copyWith(color: colors.error),
            textAlign: TextAlign.center,
          ),
          verticalSpace(16.h),
          AppButton(text: context.tr('startup_retry'), onPressed: onRetry),
        ],
      ),
    );
  }
}
