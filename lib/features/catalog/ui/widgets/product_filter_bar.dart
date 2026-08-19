import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../data/models/catalog_enums.dart';
import '../../data/models/filter_view.dart';
import '../../data/models/localized.dart';
import 'filters_sheet.dart';
import '../../logic/products_bloc/products_bloc.dart';
import '../../logic/products_bloc/products_event.dart';
import '../../logic/products_bloc/products_state.dart';

/// Opens the filter sheet and applies whatever comes back.
///
/// Lives beside the bar rather than in either screen so the two entry points
/// cannot drift apart — the rail and the fixed filters must behave the same
/// whether a rep reached the list by browsing or by searching.
Future<void> openProductFilters(
  BuildContext context,
  ProductsState state,
) async {
  final bloc = context.read<ProductsBloc>();
  final next = await showFiltersSheet(
    context: context,
    filters: state.filters,
    query: state.query,
    resultCount: state.total,
  );
  if (next != null) bloc.add(ProductsEvent.queryChanged(next));
}

Future<void> openProductSort(BuildContext context, ProductsState state) async {
  final bloc = context.read<ProductsBloc>();
  final picked = await showModalBottomSheet<ProductSort>(
    context: context,
    builder: (sheetContext) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final option in ProductSort.values)
            // `relevance` is only offered with a usable term: the server
            // silently downgrades it to `name` without one, and an option
            // that lies about what it did is worse than an absent option.
            if (option != ProductSort.relevance ||
                state.query.effectiveQuery != null)
              ListTile(
                title: Text(sheetContext.tr(option.labelKey)),
                trailing: state.query.effectiveSort == option
                    ? Icon(Icons.check, color: sheetContext.colors.brand500)
                    : null,
                onTap: () => sheetContext.pop(option),
              ),
        ],
      ),
    ),
  );
  if (picked != null) bloc.add(ProductsEvent.sortChanged(picked));
}

/// The filter / sort / result-count row.
///
/// Shared by the category screen and the search screen: §11.7 ANDs `q`,
/// `category`, `attr[…]`, `hasDatasheet` and `available`
/// into one `where`, so a search result set is filterable on exactly the same
/// terms as a category's — there is no reason for the two screens to offer
/// different controls.
class ProductFilterBar extends StatelessWidget {
  final ProductsState state;
  final VoidCallback onFilters;
  final VoidCallback onSort;

  const ProductFilterBar({
    super.key,
    required this.state,
    required this.onFilters,
    required this.onSort,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Row(
      children: [
        // Always shown, even when the `attr` rail comes back empty — the
        // sheet's fixed group (datasheet, availability) still
        // applies to every result set, so there is never nothing to filter
        // by. An empty rail is a normal outcome, not a reason to hide the
        // whole control.
        _BarButton(
          label: context.tr('catalog_filters_title'),
          icon: Icons.tune_rounded,
          active: state.query.hasFilters,
          badge: state.query.appliedFilterCount,
          onTap: onFilters,
        ),
        horizontalSpace(8),
        _BarButton(
          label: context.tr(state.query.effectiveSort.labelKey),
          icon: Icons.keyboard_arrow_down_rounded,
          active: false,
          onTap: onSort,
        ),
        const Spacer(),
        // ⚠️ This is the *result* total from `/products`, never a category
        // count — the two legitimately disagree because category counts
        // ignore published-version membership (BR-8).
        Text(
          context
              .tr('catalog_result_count')
              .replaceAll('{count}', '${state.total}'),
          style: context.textStyles.xsMedium.copyWith(color: colors.ink400),
        ),
      ],
    );
  }
}

class _BarButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool active;
  final int badge;
  final VoidCallback onTap;

  const _BarButton({
    required this.label,
    required this.icon,
    required this.active,
    this.badge = 0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 7.h),
        decoration: BoxDecoration(
          color: active ? colors.brand50 : colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.full),
          border: Border.all(
            color: active ? colors.brand300 : colors.Color13,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 14.sp,
              color: active ? colors.brand600 : colors.textColor70,
            ),
            horizontalSpace(5),
            Text(
              label,
              style: context.textStyles.xsSemibold.copyWith(
                color: active ? colors.brand600 : colors.textColor,
              ),
            ),
            if (active && badge > 0) ...[
              horizontalSpace(5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  color: colors.brand500,
                  borderRadius: BorderRadius.circular(AppRadius.full),
                ),
                child: Text(
                  '$badge',
                  style: context.textStyles.xsBold.copyWith(
                    color: colors.white,
                    fontSize: 9.sp,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// The applied filters, each removable in one tap. Labels come from the
/// rail's own options so a chip reads "Black", not `BLACK`.
class AppliedFilterPills extends StatelessWidget {
  final ProductsState state;

  const AppliedFilterPills({super.key, required this.state});

  String _labelFor(BuildContext context, String code, String optionCode) {
    for (final filter in state.filters) {
      if (filter.code != code) continue;
      // ⚠️ The type argument is load-bearing. A bare `const []` is
      // `List<dynamic>`, which makes `option` dynamic — and `resolve` is an
      // **extension** method, which does not exist under dynamic dispatch.
      // It compiles clean and then throws "has no instance method 'resolve'"
      // at runtime, which is exactly what happened here.
      for (final option in filter.options ?? const <FilterOptionView>[]) {
        if (option.code == optionCode) return option.label.resolve(context);
      }
    }
    // A RANGE token (`10..20`) has no option to name it, and a stale code
    // may no longer be in the rail — showing the raw token still tells the
    // rep what is filtering their list.
    return optionCode.replaceAll('..', ' – ');
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final query = state.query;
    return Wrap(
      spacing: 6.w,
      runSpacing: 6.h,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (final entry in query.attributes.entries)
          for (final value in entry.value)
            _Pill(
              label: _labelFor(context, entry.key, value),
              onRemove: () => context.read<ProductsBloc>().add(
                ProductsEvent.attributeToggled(
                  code: entry.key,
                  optionCode: value,
                ),
              ),
            ),

        // The fixed filters get pills too. Without them a rep could have an
        // availability filter narrowing the list with nothing on screen
        // saying so — the applied row would claim the list is unfiltered
        // while it isn't.
        if (query.hasDatasheet == true)
          _Pill(
            label: context.tr('catalog_filters_has_datasheet'),
            onRemove: () => context.read<ProductsBloc>().add(
              ProductsEvent.queryChanged(
                query.copyWith(hasDatasheet: null, page: 1),
              ),
            ),
          ),
        if (query.available != null)
          _Pill(
            label: context.tr(
              query.available == true
                  ? 'catalog_filters_available_only'
                  : 'catalog_filters_unavailable_only',
            ),
            onRemove: () => context.read<ProductsBloc>().add(
              ProductsEvent.queryChanged(
                query.copyWith(available: null, page: 1),
              ),
            ),
          ),

        PressableScale(
          onTap: () => context.read<ProductsBloc>().add(
            const ProductsEvent.filtersCleared(),
          ),
          child: Text(
            context.tr('catalog_filters_clear_all'),
            style: context.textStyles.xsBold.copyWith(color: colors.ink500),
          ),
        ),
      ],
    );
  }
}

/// One removable filter chip. Tapping anywhere on it removes that filter —
/// the whole pill is the target, not just the ✕, which is a 12px hit area.
class _Pill extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const _Pill({required this.label, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onRemove,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: colors.brand50,
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: context.textStyles.xsSemibold.copyWith(
                color: colors.brand700,
              ),
            ),
            horizontalSpace(5),
            Icon(Icons.close_rounded, size: 12.sp, color: colors.brand600),
          ],
        ),
      ),
    );
  }
}
