import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_power/core/helpers/spacing.dart' show horizontalSpace;

import '../helpers/extensions.dart';
import '../localization/app_localizations.dart';
import '../theming/app_colors.dart';
import '../theming/app_radius.dart';
import '../theming/styles.dart';

/// Shared sub-page header: back button + optional title. Consolidates what
/// used to be a near-identical private `_buildHeaderRow()`/`_buildBackButton()`
/// on every auth sub-screen (forgot-password, reset-password, verify-otp)
/// into one design-system-compliant widget.
class AppHeader extends StatelessWidget {
  final String? title;
  const AppHeader({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              width: 38.w,
              height: 38.h,
              decoration: BoxDecoration(
                color: context.colors.colorHeader,
                borderRadius: BorderRadius.circular(AppRadius.field),
                border: Border.all(color: context.colors.ink200),
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                color: context.colors.iconColor,
                size: 18.sp,
              ),
            ),
          ),
          horizontalSpace(40.w),
          if (title != null)
            Expanded(
              child: Text(
                context.tr(title!),
                style: context.textStyles.baseBold.copyWith(fontSize: 18.sp),
                overflow: TextOverflow.ellipsis,
              ),
            ),
        ],
      ),
    );
  }
}
