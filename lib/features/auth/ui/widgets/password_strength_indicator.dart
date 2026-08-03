// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/styles.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  final String password;

  const PasswordStrengthIndicator({super.key, required this.password});

  @override
  Widget build(BuildContext context) {
    final checks = _getChecks(context);
    final passedCount = checks.where((c) => c.passed).length;
    final strength = _getStrength(context, passedCount);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Strength bar
        _StrengthBar(passedCount: passedCount, total: checks.length),
        verticalSpace(10.h),
        // Header row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.tr('password_strength'),
              style: context.textStyles.xsMedium,
            ),
            Text(
              strength.label,
              style: context.textStyles.xsSemibold.copyWith(
                color: strength.color,
              ),
            ),
          ],
        ),
        verticalSpace(8.h),
        // Requirement checks
        ...checks.map((check) => _CheckRow(check: check)),
      ],
    );
  }

  List<_PasswordCheck> _getChecks(BuildContext context) {
    return [
      _PasswordCheck(
        label: context.tr('error_password_too_short'),
        passed: password.length >= 8,
      ),
      _PasswordCheck(
        label: context.tr('error_password_digit'),
        passed: password.contains(RegExp(r'[0-9]')),
      ),
      _PasswordCheck(
        label: context.tr('error_password_lowercase'),
        passed: password.contains(RegExp(r'[a-z]')),
      ),
      _PasswordCheck(
        label: context.tr('error_password_uppercase'),
        passed: password.contains(RegExp(r'[A-Z]')),
      ),
      _PasswordCheck(
        label: context.tr('error_password_special'),
        passed: password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
      ),
    ];
  }

  _StrengthLevel _getStrength(BuildContext context, int passedCount) {
    final colors = context.colors;
    if (passedCount == 0) return _StrengthLevel('', Colors.transparent);
    if (passedCount <= 2) {
      return _StrengthLevel(context.tr('weak'), colors.error);
    }
    if (passedCount <= 4) {
      return _StrengthLevel(context.tr('fair'), colors.warning);
    }
    return _StrengthLevel(context.tr('strong'), colors.success);
  }
}

class _StrengthBar extends StatelessWidget {
  final int passedCount;
  final int total;

  _StrengthBar({required this.passedCount, required this.total});
  Color? color;
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: List.generate(total, (index) {
        final isActive = index < passedCount;
        if (!isActive) {
          color = colors.iconColor;
        } else if (passedCount <= 2) {
          color = colors.error;
        } else if (passedCount <= 4) {
          color = colors.warning;
        } else {
          color = colors.success;
        }

        return Expanded(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: 3.h,
            margin: EdgeInsetsDirectional.only(
              end: index < total - 1 ? 4.w : 0,
            ),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        );
      }),
    );
  }
}

class _CheckRow extends StatelessWidget {
  final _PasswordCheck check;

  const _CheckRow({required this.check});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.only(bottom: 4.h),
      child: Row(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: check.passed
                ? Icon(
                    Icons.check_circle,
                    key: const ValueKey('check'),
                    size: 15.sp,
                    color: colors.success,
                  )
                : Icon(
                    Icons.circle_outlined,
                    key: const ValueKey('circle'),
                    size: 15.sp,
                    color: colors.Color70,
                  ),
          ),
          SizedBox(width: 6.w),
          Expanded(
            child: Text(
              check.label,
              style: context.textStyles.xsMedium.copyWith(
                color: check.passed ? colors.success : colors.Color70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PasswordCheck {
  final String label;
  final bool passed;

  _PasswordCheck({required this.label, required this.passed});
}

class _StrengthLevel {
  final String label;
  final Color color;

  _StrengthLevel(this.label, this.color);
}
