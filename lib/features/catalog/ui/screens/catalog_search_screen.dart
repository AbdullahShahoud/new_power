import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_radius.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widget/empty_state.dart';
import '../../../../core/widget/pressable_scale.dart';
import '../../data/models/localized.dart';
import '../../data/models/product_query.dart';
import '../../data/models/product_view.dart';
import '../../logic/products_bloc/products_bloc.dart';
import '../../logic/products_bloc/products_event.dart';
import '../../logic/products_bloc/products_state.dart';
import '../../logic/search_bloc/search_bloc.dart';
import '../widgets/catalog_skeletons.dart';
import '../widgets/product_card.dart';
import '../widgets/product_filter_bar.dart';

/// Catalogue search: typeahead while typing, a real result list on submit.
///
/// The empty state here is the most important copy in the feature. §11.3 —
/// the search corpus is **names, codes, category names and highlight ENUM
/// options only**; spec sheets and descriptions are deliberately excluded.
/// So "IP65" genuinely cannot match, and a screen that says "try again"
/// would be lying. It teaches the limit and points at the filters instead.
class CatalogSearchScreen extends StatelessWidget {
  const CatalogSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<SearchBloc>()),
        BlocProvider(create: (_) => getIt<ProductsBloc>()),
      ],
      child: const _SearchView(),
    );
  }
}

class _SearchView extends StatefulWidget {
  const _SearchView();

  @override
  State<_SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<_SearchView> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final _scrollController = ScrollController();
  Timer? _debounce;

  /// True once a term has been submitted — the screen then shows results
  /// instead of suggestions.
  bool _submitted = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _focusNode.requestFocus(),
    );
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    _focusNode.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 400) {
      context.read<ProductsBloc>().add(
        const ProductsEvent.nextPageRequested(),
      );
    }
  }

  /// 350 ms, above §19.4's 300 ms floor. Without it the 30-request budget is
  /// gone in about 15 keystrokes.
  void _onChanged(String value) {
    setState(() => _submitted = false);
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      if (!mounted) return;
      context.read<SearchBloc>().add(SearchEvent.termChanged(value));
    });
  }

  void _submit(String value) {
    final trimmed = value.trim();
    // §11.2 — the server silently drops a term under 2 characters and
    // returns an unfiltered list. Presenting that as a search result would
    // be a lie, so the request is not sent at all.
    if (trimmed.length < 2) return;
    _debounce?.cancel();
    setState(() => _submitted = true);
    _focusNode.unfocus();
    context.read<ProductsBloc>().add(
      ProductsEvent.queryChanged(ProductQuery(q: trimmed)),
    );
  }

  void _clear() {
    _controller.clear();
    _debounce?.cancel();
    setState(() => _submitted = false);
    context.read<SearchBloc>().add(const SearchEvent.cleared());
    _focusNode.requestFocus();
  }

  void _openProduct(String slug) => context.pushNamed(
    Routes.productDetailScreen,
    arguments: {'idOrSlug': slug},
  );

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.page,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 8.h),
              child: Row(
                children: [
                  PressableScale(
                    onTap: () => context.pop(),
                    child: Container(
                      width: 36.w,
                      height: 36.w,
                      decoration: BoxDecoration(
                        color: colors.surface,
                        borderRadius: BorderRadius.circular(AppRadius.field),
                      ),
                      child: Icon(
                        Icons.arrow_back_rounded,
                        size: 18.sp,
                        color: colors.textColor,
                      ),
                    ),
                  ),
                  horizontalSpace(8),
                  Expanded(child: _SearchField(
                    controller: _controller,
                    focusNode: _focusNode,
                    onChanged: _onChanged,
                    onSubmitted: _submit,
                    onClear: _clear,
                  )),
                ],
              ),
            ),
            Expanded(
              child: _submitted ? _buildResults() : _buildSuggestions(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestions() {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state.status == SuggestStatus.idle) {
          return _IntroState(term: state.term);
        }
        if (state.status == SuggestStatus.loading) {
          return CatalogListSkeleton(
            itemCount: 5,
            padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 0),
          );
        }
        if (state.status == SuggestStatus.empty) {
          return _NoResultsState(term: state.term, onBrowse: () => context.pop());
        }
        return ListView.builder(
          padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 24.h),
          itemCount: state.suggestions.length,
          itemBuilder: (context, index) => _SuggestionRow(
            suggestion: state.suggestions[index],
            onTap: () => _openProduct(state.suggestions[index].slug),
          ),
        );
      },
    );
  }

  Widget _buildResults() {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        switch (state.status) {
          case ProductsStatus.initial:
          case ProductsStatus.loading:
            return CatalogGridSkeleton(
              padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 24.h),
            );
          case ProductsStatus.catalogUnavailable:
            return Center(
              child: EmptyState(
                icon: Icons.cloud_off_outlined,
                title: context.tr('catalog_unavailable_title'),
                subtitle: context.tr('catalog_unavailable_subtitle'),
              ),
            );
          case ProductsStatus.networkError:
            return Center(
              child: EmptyState(
                icon: Icons.wifi_off_rounded,
                title: context.tr('error_unexpected'),
                subtitle: state.errorMessage,
              ),
            );
          case ProductsStatus.empty:
            return _NoResultsState(
              term: state.query.q ?? '',
              onBrowse: () => context.pop(),
            );
          case ProductsStatus.loaded:
            return CustomScrollView(
              controller: _scrollController,
              slivers: [
                // The same controls the category screen offers. §11.7 ANDs
                // `q` with every filter, and `/categories/filters` accepts
                // `q` too — so a search has a real rail of its own, computed
                // over the matched set rather than a category's.
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(20.w, 4.h, 20.w, 8.h),
                  sliver: SliverToBoxAdapter(
                    child: ProductFilterBar(
                      state: state,
                      onFilters: () => openProductFilters(context, state),
                      onSort: () => openProductSort(context, state),
                    ),
                  ),
                ),
                if (state.query.hasFilters)
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 8.h),
                    sliver: SliverToBoxAdapter(
                      child: AppliedFilterPills(state: state),
                    ),
                  ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  sliver: SliverGrid(
                    gridDelegate: productGridDelegate(
                      MediaQuery.sizeOf(context).width - 40.w,
                    ),
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final product = state.products[index];
                      return ProductCard(
                        product: product,
                        onTap: () => _openProduct(product.slug),
                      );
                    }, childCount: state.products.length),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 24.h)),
              ],
            );
        }
      },
    );
  }
}

class _SearchField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onClear;

  const _SearchField({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onSubmitted,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      textInputAction: TextInputAction.search,
      style: context.textStyles.smMedium,
      decoration: InputDecoration(
        isDense: true,
        hintText: context.tr('catalog_search_hint'),
        hintStyle: context.textStyles.smMedium.copyWith(color: colors.ink400),
        prefixIcon: Icon(Icons.search, size: 18.sp, color: colors.ink400),
        suffixIcon: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, value, _) => value.text.isEmpty
              ? const SizedBox.shrink()
              : PressableScale(
                  onTap: onClear,
                  child: Icon(
                    Icons.close_rounded,
                    size: 18.sp,
                    color: colors.ink400,
                  ),
                ),
        ),
        filled: true,
        fillColor: colors.surface,
        contentPadding: EdgeInsets.symmetric(vertical: 12.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.field),
          borderSide: BorderSide(color: colors.Color13),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.field),
          borderSide: BorderSide(color: colors.Color13),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.field),
          borderSide: BorderSide(color: colors.brand400),
        ),
      ),
    );
  }
}

class _SuggestionRow extends StatelessWidget {
  final SuggestionView suggestion;
  final VoidCallback onTap;

  const _SuggestionRow({required this.suggestion, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    // No thumbnails: `/products/suggest` returns no image field at all, and
    // a placeholder column of grey squares would be worse than none.
    return PressableScale(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: [
            Icon(
              Icons.lightbulb_outline_rounded,
              size: 18.sp,
              color: colors.ink400,
            ),
            horizontalSpace(12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    suggestion.name.resolve(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.smMedium,
                  ),
                  if (suggestion.sku != null) ...[
                    verticalSpace(2.h),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        suggestion.sku!,
                        style: context.textStyles.xsMedium.copyWith(
                          color: colors.ink400,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              Icons.north_west_rounded,
              size: 14.sp,
              color: colors.ink300,
            ),
          ],
        ),
      ),
    );
  }
}

/// Shown before a usable term exists. States the corpus up front, so the
/// limit is learned before it bites.
class _IntroState extends StatelessWidget {
  final String term;

  const _IntroState({required this.term});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: EmptyState(
          icon: Icons.search_rounded,
          title: context.tr('catalog_search_intro_title'),
          subtitle: context.tr('catalog_search_intro_subtitle'),
        ),
      ),
    );
  }
}

/// The teaching state. Deliberately does **not** say "try again" and does
/// **not** offer "did you mean…" — §11.4 is explicit that there is no fuzzy
/// matching and no typo tolerance in the backend, despite what the DTO
/// description claims.
class _NoResultsState extends StatelessWidget {
  final String term;
  final VoidCallback onBrowse;

  const _NoResultsState({required this.term, required this.onBrowse});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            EmptyState(
              icon: Icons.search_off_rounded,
              title: context
                  .tr('catalog_search_no_results_title')
                  .replaceAll('{term}', term),
              subtitle: context.tr('catalog_search_no_results_subtitle'),
            ),
            verticalSpace(16.h),
            PressableScale(
              onTap: onBrowse,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 18.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  color: colors.brand500,
                  borderRadius: BorderRadius.circular(AppRadius.field),
                ),
                child: Text(
                  context.tr('catalog_browse_categories'),
                  style: context.textStyles.smBold.copyWith(
                    color: colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
