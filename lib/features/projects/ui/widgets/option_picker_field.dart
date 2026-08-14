import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/bottom_sheet_helper.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/pressable_scale.dart';

/// A tap-to-open bottom-sheet picker styled like `AppTextField` (same
/// surface/ink200/radius-field recipe, §5) — used wherever the module needs
/// a plain enum dropdown with no gating (funnel stage, building type,
/// construction phase). A free list, never a wizard, per Workflow 7.
class OptionPickerField<T> extends StatelessWidget {
  final String hintText;
  final T? value;
  final List<T> options;
  final String Function(T) labelOf;
  final ValueChanged<T> onChanged;
  final bool enabled;

  const OptionPickerField({
    super.key,
    required this.hintText,
    required this.value,
    required this.options,
    required this.labelOf,
    required this.onChanged,
    this.enabled = true,
  });

  Future<void> _open(BuildContext context) async {
    final selected = await showAnimatedBottomSheet<T>(
      context: context,
      initialChildSize: options.length > 6 ? 0.6 : 0.4,
      builder: (sheetContext) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (final option in options)
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  labelOf(option),
                  style: option == value
                      ? sheetContext.textStyles.smBold
                      : sheetContext.textStyles.smMedium,
                ),
                trailing: option == value
                    ? Icon(Icons.check, color: sheetContext.colors.brand500)
                    : null,
                onTap: () => Navigator.of(sheetContext).pop(option),
              ),
          ],
        );
      },
    );
    if (selected != null) onChanged(selected);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: PressableScale(
        onTap: enabled ? () => _open(context) : null,
        child: Container(
          height: 44.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: colors.surface,
            borderRadius: BorderRadius.circular(AppRadius.field),
            border: Border.all(color: colors.ink200),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value == null ? hintText : labelOf(value as T),
                  style: value == null
                      ? context.textStyles.smRegular.copyWith(
                          color: colors.ink400,
                        )
                      : context.textStyles.smRegular.copyWith(
                          color: colors.textColor,
                        ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: colors.textColor70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
