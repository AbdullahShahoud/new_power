import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/localization/app_localizations.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_radius.dart';
import '../../../core/theming/app_shadows.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widget/animated_indexed_stack.dart';
import '../../projects/ui/screens/projects_list_screen.dart';
import 'screens/home_dashboard_screen.dart';
import '../../catalog/ui/screens/catalog_home_screen.dart';
import 'screens/profile_screen.dart';

/// Post-login shell: four tabs (Home, Projects, Products, Profile) over
/// an on-brand floating bottom bar. Notifications moved off the tab bar —
/// it's reached via the bell icon on the Home tab instead (see
/// `Routes.notificationsScreen`). Replaces the old wallet-app MainScreen (QR
/// scanner, payments/wallet tabs, realtime sockets, PIN re-auth) — none of
/// that exists in this app; NewPower is a construction-sales-ops tool, not
/// a wallet.
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  DateTime? _lastBackPressTime;

  static const _tabs = [
    HomeDashboardScreen(),
    ProjectsListScreen(),
    CatalogHomeScreen(),
    ProfileScreen(),
  ];

  void _handleBackPress() {
    if (_currentIndex != 0) {
      setState(() => _currentIndex = 0);
      return;
    }
    final now = DateTime.now();
    final lastPress = _lastBackPressTime;
    if (lastPress != null &&
        now.difference(lastPress) <= const Duration(milliseconds: 1000)) {
      Navigator.of(context).maybePop();
      return;
    }
    _lastBackPressTime = now;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.tr('press_back_again_to_exit')),
        duration: const Duration(milliseconds: 1500),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _handleBackPress();
      },
      child: Scaffold(
        extendBody: true,
        body: AnimatedIndexedStack(index: _currentIndex, children: _tabs),
        bottomNavigationBar: _BottomNavBar(
          currentIndex: _currentIndex,
          onTabSelected: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}

class _NavTab {
  final IconData icon;
  final IconData activeIcon;
  final String labelKey;

  const _NavTab({
    required this.icon,
    required this.activeIcon,
    required this.labelKey,
  });
}

const _navTabs = [
  _NavTab(
    icon: Icons.home_outlined,
    activeIcon: Icons.home_rounded,
    labelKey: 'home',
  ),
  _NavTab(
    icon: Icons.apartment_outlined,
    activeIcon: Icons.apartment_rounded,
    labelKey: 'projects_title',
  ),
  _NavTab(
    icon: Icons.inventory_2_outlined,
    activeIcon: Icons.inventory_2_rounded,
    labelKey: 'products_title',
  ),
  _NavTab(
    icon: Icons.person_outline_rounded,
    activeIcon: Icons.person_rounded,
    labelKey: 'profile',
  ),
];

/// Floating bottom bar — Card recipe (§5): surface bg, shadow-card,
/// radius-card. Active tab: brand50 pill behind the icon + brand500
/// icon/label (bottom-nav adaptation of the doc's sidebar active treatment).
class _BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const _BottomNavBar({
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final bottomInset = MediaQuery.viewPaddingOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, bottomInset + 12.h),
      child: Container(
        height: 64.h,
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          boxShadow: AppShadows.cardHover,
        ),
        child: Row(
          children: [
            for (var i = 0; i < _navTabs.length; i++)
              Expanded(
                child: _NavBarItem(
                  tab: _navTabs[i],
                  isSelected: currentIndex == i,
                  onTap: () => onTabSelected(i),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final _NavTab tab;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.tab,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final color = isSelected ? colors.brand500 : colors.ink400;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: isSelected ? colors.brand50 : Colors.transparent,
              borderRadius: BorderRadius.circular(AppRadius.full),
            ),
            child: Icon(
              isSelected ? tab.activeIcon : tab.icon,
              color: color,
              size: 22.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            context.tr(tab.labelKey),
            style:
                (isSelected
                        ? context.textStyles.xsSemibold
                        : context.textStyles.xsMedium)
                    .copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
