import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/routing/app_startup_router.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_radius.dart';
import '../../../core/theming/app_shadows.dart';
import '../../../core/theming/app_themes.dart';
import '../../../core/theming/brand.dart';
import '../../../core/theming/brand_manager.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widget/app_logo.dart';
import '../../../core/widget/pressable_scale.dart';

/// First launch: which product line is this rep's.
///
/// Shown before anything else — before onboarding, before login — because
/// every screen after it is painted in the chosen accent, and asking later
/// would mean rebranding an app the rep had already started using.
///
/// ⚠️ The choice is **permanent for the install** (see [BrandManager]), so
/// this screen confirms before committing. It is the one screen in the app
/// where a mis-tap cannot be undone from inside the app.
///
/// Each card is painted in its own brand's colours rather than the app's
/// current ones. Before a selection exists there is no "current" brand to
/// borrow, and showing three logos in one shared accent would misrepresent
/// all three.
class BrandSelectionScreen extends StatelessWidget {
  const BrandSelectionScreen({super.key});

  Future<void> _choose(BuildContext context, Brand brand) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        final colors = dialogContext.colors;
        return AlertDialog(
          backgroundColor: colors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.card),
          ),
          title: Text(
            dialogContext.tr('brand_confirm_title'),
            style: dialogContext.textStyles.baseBold,
          ),
          content: Text(
            dialogContext
                .tr('brand_confirm_message')
                .replaceAll('{brand}', dialogContext.tr(brand.displayNameKey)),
            style: dialogContext.textStyles.smRegular,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(dialogContext.tr('cancel')),
            ),
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(dialogContext.tr('confirm')),
            ),
          ],
        );
      },
    );
    if (confirmed != true || !context.mounted) return;

    await getIt<BrandManager>().select(brand);
    if (!context.mounted) return;

    // Resolve the real first route now that the brand is known. This screen
    // stood in for it, so it must not stay on the stack behind whatever
    // comes next.
    final next = await AppStartupRouter.resolve();
    if (!context.mounted) return;
    Navigator.of(context).pushNamedAndRemoveUntil(next, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.page,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(24.h),
              Text(
                context.tr('brand_select_title'),
                style: context.textStyles.xl2Semibold,
              ),
              verticalSpace(8.h),
              Text(
                context.tr('brand_select_subtitle'),
                style: context.textStyles.smRegular.copyWith(
                  color: colors.ink500,
                ),
              ),
              verticalSpace(28.h),
              Expanded(
                child: ListView.separated(
                  itemCount: Brand.values.length,
                  separatorBuilder: (_, _) => verticalSpace(14.h),
                  itemBuilder: (context, index) {
                    final brand = Brand.values[index];
                    return _BrandCard(
                      brand: brand,
                      onTap: () => _choose(context, brand),
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

/// One brand, shown in its own identity.
class _BrandCard extends StatelessWidget {
  final Brand brand;
  final VoidCallback onTap;

  const _BrandCard({required this.brand, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // The card previews the brand, so everything inside it is themed as that
    // brand — not as the app's current one. `BrandScope` plus a matching
    // `Theme` means `AppLogo` and the tokens below resolve to this row's
    // brand without either needing to be told twice.
    return BrandScope(
      brand: brand,
      child: Theme(
        data: isDark ? AppThemes.dark(brand) : AppThemes.light(brand),
        child: Builder(
          builder: (context) {
            final colors = context.colors;
            return PressableScale(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 18.w,
                  vertical: 20.h,
                ),
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(AppRadius.card),
                  boxShadow: AppShadows.card,
                  border: Border.all(color: colors.brand200, width: 1.5),
                ),
                child: Row(
                  children: [
                    // A fixed box so three very different aspect ratios line
                    // up down the column instead of each card sizing itself
                    // to its own artwork.
                    SizedBox(
                      width: 84.w,
                      height: 56.h,
                      child: Center(
                        child: AppLogo(brand: brand, height: 40.h),
                      ),
                    ),
                    horizontalSpace(16),
                    Expanded(
                      child: Text(
                        context.tr(brand.displayNameKey),
                        style: context.textStyles.baseBold,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: colors.brand500,
                      size: 22.sp,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
