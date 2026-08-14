import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/app_button.dart';
import '../../../../core/widget/bottom_sheet_grabber.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../data/models/catalog_enums.dart';
import '../../data/models/filter_view.dart';
import '../../data/models/localized.dart';
import '../../data/models/product_query.dart';

/// The filter rail, as a scrollable bottom sheet.
///
/// A sheet rather than a fixed-height panel because rail density is data,
/// not layout: Track Light offers 3 filters over 110 products, Down Light
/// offers 14 over 64. Anything with a fixed height looks broken at one end
/// of that range (§7.5).
///
/// Returns the edited [ProductQuery], or `null` if dismissed.
Future<ProductQuery?> showFiltersSheet({
  required BuildContext context,
  required List<FilterView> filters,
  required ProductQuery query,
  required int resultCount,
}) {
  return showModalBottomSheet<ProductQuery>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _FiltersSheet(
      filters: filters,
      query: query,
      resultCount: resultCount,
    ),
  );
}

class _FiltersSheet extends StatefulWidget {
  final List<FilterView> filters;
  final ProductQuery query;
  final int resultCount;

  const _FiltersSheet({
    required this.filters,
    required this.query,
    required this.resultCount,
  });

  @override
  State<_FiltersSheet> createState() => _FiltersSheetState();
}

class _FiltersSheetState extends State<_FiltersSheet> {
  late ProductQuery _draft = widget.query;

  /// Per-attribute search text for `truncated` rails — see [_DiscreteGroup].
  final Map<String, String> _optionSearch = {};

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.4,
      maxChildSize: 0.92,
      expand: false,
      builder: (context, scrollController) => Container(
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        ),
        child: Column(
          children: [
            const BottomSheetGrabber(),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 4.h, 20.w, 8.h),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      context.tr('catalog_filters_title'),
                      style: context.textStyles.baseBold,
                    ),
                  ),
                  if (_draft.hasFilters)
                    PressableScale(
                      onTap: () => setState(() => _draft = _draft.cleared()),
                      child: Text(
                        context.tr('catalog_filters_reset'),
                        style: context.textStyles.smBold.copyWith(
                          color: colors.brand600,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Divider(height: 1, color: colors.Color13),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 20.h),
                itemCount: widget.filters.length,
                itemBuilder: (context, index) {
                  final filter = widget.filters[index];
                  // ⚠️ The control is chosen by `strategy`, never by `type`.
                  // IP_RATING is stored as NUMBER but must render as
                  // checkboxes — switching on `type` here is precisely the
                  // bug `strategy` exists to prevent (§12.2).
                  return switch (filter.strategy) {
                    FilterStrategy.range => _RangeGroup(
                      filter: filter,
                      query: _draft,
                      onChanged: (next) => setState(() => _draft = next),
                    ),
                    FilterStrategy.discrete => _DiscreteGroup(
                      filter: filter,
                      query: _draft,
                      search: _optionSearch[filter.code] ?? '',
                      onSearchChanged: (value) =>
                          setState(() => _optionSearch[filter.code] = value),
                      onChanged: (next) => setState(() => _draft = next),
                    ),
                    // `NONE` never reaches a client; if it ever does, the
                    // filter is ignored rather than guessed at.
                    FilterStrategy.none ||
                    FilterStrategy.unknown => const SizedBox.shrink(),
                  };
                },
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 16.h),
              decoration: BoxDecoration(
                color: colors.surface,
                border: Border(top: BorderSide(color: colors.Color13)),
              ),
              child: SafeArea(
                top: false,
                child: AppButton(
                  text: context.tr('catalog_filters_apply'),
                  onPressed: () => context.pop(_draft),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// `strategy: DISCRETE` — a checkbox list, whatever the storage type.
///
/// Option codes are sent back **verbatim**. For a NUMBER attribute the rail
/// hands over identity tokens like `65~65`, and rewriting one as `65` would
/// switch the server to interval-overlap matching — returning more products
/// than the count printed next to the box (§12.4).
class _DiscreteGroup extends StatelessWidget {
  final FilterView filter;
  final ProductQuery query;
  final String search;
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<ProductQuery> onChanged;

  const _DiscreteGroup({
    required this.filter,
    required this.query,
    required this.search,
    required this.onSearchChanged,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final options = filter.options ?? const <FilterOptionView>[];
    if (options.isEmpty) return const SizedBox.shrink();

    final selected = query.attributes[filter.code] ?? const <String>[];
    final needle = search.trim().toLowerCase();
    final visible = needle.isEmpty
        ? options
        : options
              .where(
                (o) =>
                    o.label.resolve(context).toLowerCase().contains(needle) ||
                    o.code.toLowerCase().contains(needle),
              )
              .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _GroupHeader(filter: filter),
        // `truncated` means the server capped the list at 24 of a longer
        // tail, so a search box is the only way to reach the rest.
        if (filter.truncated) ...[
          verticalSpace(6.h),
          _OptionSearchField(value: search, onChanged: onSearchChanged),
        ],
        verticalSpace(4.h),
        for (final option in visible)
          _OptionRow(
            label: option.label.resolve(context),
            count: option.count,
            selected: selected.contains(option.code),
            onTap: () =>
                onChanged(query.toggleAttribute(filter.code, option.code)),
          ),
        if (filter.truncated)
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(
              context
                  .tr('catalog_filters_truncated')
                  .replaceAll('{shown}', '${options.length}')
                  .replaceAll('{total}', '${filter.count}'),
              style: context.textStyles.xsMedium.copyWith(
                color: colors.ink400,
              ),
            ),
          ),
        verticalSpace(18.h),
      ],
    );
  }
}

/// `strategy: RANGE` — a two-ended slider emitting `lo..hi`.
///
/// `..` is **overlap**, a different question from the `~` identity form the
/// discrete boxes send: `10..20` means "works anywhere in 10–20" and matches
/// a product rated 5–30, which is the whole point (§12.4).
class _RangeGroup extends StatefulWidget {
  final FilterView filter;
  final ProductQuery query;
  final ValueChanged<ProductQuery> onChanged;

  const _RangeGroup({
    required this.filter,
    required this.query,
    required this.onChanged,
  });

  @override
  State<_RangeGroup> createState() => _RangeGroupState();
}

class _RangeGroupState extends State<_RangeGroup> {
  RangeValues? _values;

  double get _min => (widget.filter.range?.min ?? 0).toDouble();
  double get _max => (widget.filter.range?.max ?? 1).toDouble();

  RangeValues get _current {
    if (_values != null) return _values!;
    final applied = widget.query.attributes[widget.filter.code];
    if (applied != null && applied.isNotEmpty) {
      final parsed = _parse(applied.first);
      if (parsed != null) return parsed;
    }
    return RangeValues(_min, _max);
  }

  /// Reads back a `lo..hi` token this sheet emitted. An open end (`10..`)
  /// falls back to the rail's own bound.
  RangeValues? _parse(String token) {
    final parts = token.split('..');
    if (parts.length != 2) return null;
    final lo = double.tryParse(parts[0]) ?? _min;
    final hi = double.tryParse(parts[1]) ?? _max;
    if (lo > hi) return null;
    return RangeValues(lo.clamp(_min, _max), hi.clamp(_min, _max));
  }

  String _format(double value) {
    if (value == value.roundToDouble()) return value.toInt().toString();
    return value.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    // The server already drops a RANGE filter whose ends meet — a slider
    // that cannot move is a dead control. Guarding anyway keeps a malformed
    // payload from throwing inside the sheet.
    if (widget.filter.range == null || _min >= _max) {
      return const SizedBox.shrink();
    }

    final values = _current;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _GroupHeader(filter: widget.filter),
        RangeSlider(
          values: values,
          min: _min,
          max: _max,
          activeColor: colors.brand500,
          inactiveColor: colors.Color13,
          onChanged: (next) => setState(() => _values = next),
          onChangeEnd: (next) {
            final atBounds = next.start <= _min && next.end >= _max;
            widget.onChanged(
              atBounds
                  // Both ends at the rail's bounds is "no opinion" — sending
                  // it would filter nothing while still looking active.
                  ? widget.query.withoutAttribute(widget.filter.code)
                  : widget.query.setAttribute(widget.filter.code, [
                      '${_format(next.start)}..${_format(next.end)}',
                    ]),
            );
          },
        ),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _format(_min),
                style: context.textStyles.xsMedium.copyWith(
                  color: colors.ink400,
                ),
              ),
              Text(
                '${_format(values.start)} – ${_format(values.end)}',
                style: context.textStyles.xsBold.copyWith(
                  color: colors.brand600,
                ),
              ),
              Text(
                _format(_max),
                style: context.textStyles.xsMedium.copyWith(
                  color: colors.ink400,
                ),
              ),
            ],
          ),
        ),
        verticalSpace(18.h),
      ],
    );
  }
}

class _GroupHeader extends StatelessWidget {
  final FilterView filter;

  const _GroupHeader({required this.filter});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: [
        Text(
          filter.label.resolve(context),
          style: context.textStyles.smBold,
        ),
        if (filter.unit != null) ...[
          horizontalSpace(6),
          Directionality(
            textDirection: TextDirection.ltr,
            child: Text(
              filter.unit!,
              style: context.textStyles.xsMedium.copyWith(
                color: colors.ink400,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _OptionRow extends StatelessWidget {
  final String label;
  final int count;
  final bool selected;
  final VoidCallback onTap;

  const _OptionRow({
    required this.label,
    required this.count,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 7.h),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 18.w,
              height: 18.w,
              decoration: BoxDecoration(
                color: selected ? colors.brand500 : Colors.transparent,
                border: Border.all(
                  color: selected ? colors.brand500 : colors.ink300,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: selected
                  ? Icon(Icons.check, size: 12.sp, color: colors.white)
                  : null,
            ),
            horizontalSpace(10),
            Expanded(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textStyles.smMedium,
              ),
            ),
            Text(
              '$count',
              style: context.textStyles.xsMedium.copyWith(
                color: colors.ink400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionSearchField extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;

  const _OptionSearchField({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return TextFormField(
      initialValue: value,
      onChanged: onChanged,
      style: context.textStyles.smMedium,
      decoration: InputDecoration(
        isDense: true,
        hintText: context.tr('catalog_filters_search_values'),
        hintStyle: context.textStyles.xsMedium.copyWith(color: colors.ink400),
        prefixIcon: Icon(Icons.search, size: 16.sp, color: colors.ink400),
        prefixIconConstraints: BoxConstraints(minWidth: 32.w),
        contentPadding: EdgeInsets.symmetric(vertical: 8.h),
        filled: true,
        fillColor: colors.Color10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.field),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
