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

/// How many filter options are revealed at a time. The server caps a
/// DISCRETE rail at 24 distinct values, so this is purely about how much of
/// that lands on screen at once — never about fetching more.
const int kOptionPageSize = 15;

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

  /// How many options each attribute is currently showing. Keyed by
  /// attribute code so expanding one group never disturbs another.
  final Map<String, int> _visibleCounts = {};

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
                // +1 for the fixed group, which always leads. It is the
                // half of the sheet that does *not* change with the
                // category — the dynamic `attr` rail below it is rebuilt per
                // category and is often only three entries deep.
                itemCount: widget.filters.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _FixedFilterGroup(
                      query: _draft,
                      onChanged: (next) => setState(() => _draft = next),
                    );
                  }
                  final filter = widget.filters[index - 1];
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
                      onSearchChanged: (value) => setState(() {
                        _optionSearch[filter.code] = value;
                        // Typing narrows the list, so paging starts over —
                        // otherwise a group expanded to 30 would show every
                        // match at once and the reveal would look broken.
                        _visibleCounts.remove(filter.code);
                      }),
                      onChanged: (next) => setState(() => _draft = next),
                      visibleCount:
                          _visibleCounts[filter.code] ?? kOptionPageSize,
                      onShowMore: () => setState(() {
                        _visibleCounts[filter.code] =
                            (_visibleCounts[filter.code] ?? kOptionPageSize) +
                            kOptionPageSize;
                      }),
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

/// The filters that exist in **every** result set, whatever category is
/// open: datasheet presence and availability.
///
/// They are grouped apart from the `attr` rail because they behave
/// differently — the rail is data (a category binds 3 attributes or 14, and
/// an attribute with no values in the current set is dropped entirely),
/// while these are fixed query parameters that always apply. A rep
/// searching across the whole catalogue has no rail worth the name; this
/// group is what makes that search filterable at all.
///
/// `reportingCategory` ("product family") was offered here and removed on
/// request. It filtered correctly, but **no rep-facing read model ever
/// returns it** — so a rep could narrow by it and then find nothing on any
/// card or detail page confirming what they had narrowed to.
class _FixedFilterGroup extends StatelessWidget {
  final ProductQuery query;
  final ValueChanged<ProductQuery> onChanged;

  const _FixedFilterGroup({required this.query, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('catalog_filters_general'),
          style: context.textStyles.smBold,
        ),
        verticalSpace(10.h),


        // `hasDatasheet: false` is accepted but has **no effect** server-side
        // (the handler skips a falsy value), so this is a two-state toggle —
        // on, or absent — never a three-way choice that would silently lie.
        _SwitchRow(
          label: context.tr('catalog_filters_has_datasheet'),
          value: query.hasDatasheet == true,
          onChanged: (on) =>
              onChanged(query.copyWith(hasDatasheet: on ? true : null, page: 1)),
        ),

        // Availability is opt-in and genuinely three-state: omitted means no
        // filter, `true` only available, `false` only unavailable. It stays
        // advisory (CP7 — the ERP owns real stock), so it filters but never
        // hides a product elsewhere in the app.
        _SwitchRow(
          label: context.tr('catalog_filters_available_only'),
          value: query.available == true,
          onChanged: (on) =>
              onChanged(query.copyWith(available: on ? true : null, page: 1)),
        ),
        verticalSpace(18.h),
        Divider(height: 1, color: colors.Color13),
        verticalSpace(14.h),
      ],
    );
  }
}


class _SwitchRow extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SwitchRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          Expanded(
            child: Text(label, style: context.textStyles.smMedium),
          ),
          Switch.adaptive(
            value: value,
            activeTrackColor: colors.brand500,
            onChanged: onChanged,
          ),
        ],
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

  /// How many options are on screen right now. Grows by [kOptionPageSize]
  /// each time the rep asks for more.
  final int visibleCount;
  final VoidCallback onShowMore;

  const _DiscreteGroup({
    required this.filter,
    required this.query,
    required this.search,
    required this.onSearchChanged,
    required this.onChanged,
    required this.visibleCount,
    required this.onShowMore,
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
        // Revealed a page at a time. A category like DIMENSIONS returns two
        // dozen values, and dropping all of them into the sheet at once
        // buried every filter below it under a wall of scrolling.
        for (final option in visible.take(visibleCount))
          _OptionRow(
            label: option.label.resolve(context),
            count: option.count,
            selected: selected.contains(option.code),
            onTap: () =>
                onChanged(query.toggleAttribute(filter.code, option.code)),
          ),

        if (visible.length > visibleCount)
          PressableScale(
            onTap: onShowMore,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    context
                        .tr('catalog_filters_show_more')
                        .replaceAll(
                          '{count}',
                          '${visible.length - visibleCount}',
                        ),
                    style: context.textStyles.xsBold.copyWith(
                      color: colors.brand600,
                    ),
                  ),
                  horizontalSpace(4),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 16.sp,
                    color: colors.brand600,
                  ),
                ],
              ),
            ),
          )
        // Only once everything the client *holds* is on screen is it honest
        // to mention the server's own cap.
        //
        // ⚠️ The old copy read "showing 24 of {filter.count}" — which was
        // wrong: `filters[].count` counts **products carrying the
        // attribute**, not distinct values (§7.5), so it compared values
        // against products and produced a nonsense ratio. The API exposes no
        // total-distinct-values figure at all, so no denominator is claimed
        // here; the search box is the only way to reach the rest.
        else if (filter.truncated)
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(
              context.tr('catalog_filters_truncated'),
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
        // The heading stays outside the LTR scope so it reads right-to-left
        // with the rest of the sheet.
        _GroupHeader(filter: widget.filter),

        // ⚠️ The slider and its axis labels **must** share one
        // `Directionality`, and it must be LTR.
        //
        // `RangeSlider` mirrors itself under RTL: min anchors right, max
        // anchors left. The label row used to be wrapped in its own
        // `Directionality.ltr` — so in Arabic the track ran one way and the
        // numbers under it ran the other. A track filled from the middle to
        // the far right read as "500 – 2592" in the labels while the axis it
        // sat on said "2592 – 3600". Identical pixels meant opposite things
        // in the two locales, and a rep could apply the inverse of the
        // filter they thought they had picked.
        //
        // Pinned to LTR rather than left ambient, because a numeric
        // measurement scale is conventionally low-to-high left-to-right in
        // both locales — the values themselves (`500`, `3600`) are Western
        // digits either way.
        Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        // Both ends at the rail's bounds is "no opinion" —
                        // sending it would filter nothing while still
                        // looking active.
                        ? widget.query.withoutAttribute(widget.filter.code)
                        : widget.query.setAttribute(widget.filter.code, [
                            '${_format(next.start)}..${_format(next.end)}',
                          ]),
                  );
                },
              ),
              Row(
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
