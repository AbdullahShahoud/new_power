import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
import '../../../auth/data/models/user_model.dart';
import '../../../auth/data/repo/auth_repository.dart';

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
