import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/app_shadows.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../data/models/category_view.dart';
import '../../data/models/localized.dart';

/// A category as a grid tile — image-led, for recognising product families
/// by shape.
class CategoryGridCard extends StatelessWidget {
  final CategoryView category;
  final VoidCallback onTap;

  const CategoryGridCard({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          boxShadow: AppShadows.card,
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: _CategoryArt(category: category),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10.w, 8.h, 10.w, 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category.name.resolve(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.xsBold,
                  ),
                  verticalSpace(2.h),
                  _CountLabel(category: category),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The same category as a row — for scanning a branch by name, where the
/// image earns less than the extra rows on screen do.
class CategoryListTile extends StatelessWidget {
  final CategoryView category;
  final VoidCallback onTap;

  const CategoryListTile({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.card),
          boxShadow: AppShadows.card,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.field),
              child: SizedBox(
                width: 46.w,
                height: 46.w,
                child: _CategoryArt(category: category, compact: true),
              ),
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    category.name.resolve(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.smBold,
                  ),
                  verticalSpace(2.h),
                  _CountLabel(category: category),
                ],
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
    );
  }
}

/// ⚠️ Deliberately worded as "N products" and never as a total beside a
/// result set. Both counts ignore published-version membership while
/// `GET /products` enforces it, so a category can advertise more than its
/// list returns (BR-8). They are navigation hints only.
class _CountLabel extends StatelessWidget {
  final CategoryView category;

  const _CountLabel({required this.category});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Text(
      context
          .tr('catalog_category_product_count')
          .replaceAll('{count}', '${category.browseCount}'),
      style: context.textStyles.xsMedium.copyWith(
        color: colors.ink400,
        fontSize: 10.sp,
      ),
    );
  }
}

class _CategoryArt extends StatelessWidget {
  final CategoryView category;
  final bool compact;

  const _CategoryArt({required this.category, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final url = category.imageUrl;

    Widget fallback() => Container(
      color: colors.Color10,
      alignment: Alignment.center,
      child: Icon(
        Icons.category_outlined,
        size: compact ? 20.sp : 30.sp,
        color: colors.brand300,
      ),
    );

    if (url == null) return fallback();
    return Image.network(
      url,
      fit: BoxFit.cover,
      loadingBuilder: (_, child, progress) =>
          progress == null ? child : Container(color: colors.Color13),
      errorBuilder: (_, _, _) => fallback(),
    );
  }
}
