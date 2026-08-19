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
import '../../data/models/category_view.dart';
import '../../data/models/localized.dart';
import '../../data/models/product_query.dart';
import '../../logic/categories_bloc/categories_bloc.dart';
import '../../logic/categories_bloc/categories_event.dart';
import '../../logic/categories_bloc/categories_state.dart';
import '../../logic/products_bloc/products_bloc.dart';
import '../../logic/products_bloc/products_event.dart';
import '../../logic/products_bloc/products_state.dart';
import '../widgets/catalog_skeletons.dart';
import '../widgets/category_tile.dart';
import '../widgets/collapsing_header.dart';
import '../widgets/product_card.dart';
import '../widgets/product_filter_bar.dart';

/// One category: its trail, its direct children, and its products.
///
/// Children and products live on the same screen because a rep opening
/// "Lighting" wants both — 15 products sit directly on root categories, so a
/// screen that showed only subcategories would hide them, and one that
/// showed only products would bury the branches.
class CategoryScreen extends StatelessWidget {
  final String idOrSlug;
  final Localized? name;

  const CategoryScreen({super.key, required this.idOrSlug, this.name});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<CategoriesBloc>()
                ..add(CategoriesEvent.categoryRequested(idOrSlug)),
        ),
        BlocProvider(
          create: (_) => getIt<ProductsBloc>()
            ..add(
              ProductsEvent.opened(
                ProductQuery(category: idOrSlug, includeSubtree: true),
              ),
            ),
        ),
      ],
      child: _CategoryView(idOrSlug: idOrSlug, fallbackName: name),
    );
  }
}

class _CategoryView extends StatefulWidget {
  final String idOrSlug;
  final Localized? fallbackName;

  const _CategoryView({required this.idOrSlug, this.fallbackName});

  @override
  State<_CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<_CategoryView> {
  final _scrollController = ScrollController();
  static const _headerHeight = 54.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final position = _scrollController.position;
    if (position.pixels >= position.maxScrollExtent - 400) {
      context.read<ProductsBloc>().add(const ProductsEvent.nextPageRequested());
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final topPadding = MediaQuery.paddingOf(context).top;
    final headerHeight = _headerHeight.h + topPadding;

    return Scaffold(
      backgroundColor: colors.page,
      body: BlocConsumer<ProductsBloc, ProductsState>(
        // §19.3 — the user is owed a notice when a stale filter was dropped
        // and the request silently retried; different results with no
        // explanation would be worse than the original error.
        listenWhen: (p, c) => p.droppedFilterCode != c.droppedFilterCode,
        listener: (context, state) {
          if (state.droppedFilterCode == null) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.tr('catalog_filter_dropped'))),
          );
        },
        builder: (context, productsState) {
          return CollapsingHeader(
            controller: _scrollController,
            height: headerHeight,
            backgroundColor: colors.page,
            header: Padding(
              padding: EdgeInsets.only(top: topPadding),
              child: _CategoryAppBar(fallbackName: widget.fallbackName),
            ),
            child: RefreshIndicator(
              color: colors.brand500,
              onRefresh: () async => context.read<ProductsBloc>().add(
                const ProductsEvent.refreshed(),
              ),
              child: _buildScrollView(context, productsState, headerHeight),
            ),
          );
        },
      ),
    );
  }

  Widget _buildScrollView(
    BuildContext context,
    ProductsState productsState,
    double headerHeight,
  ) {
    final categoriesState = context.watch<CategoriesBloc>().state;
    final children =
        categoriesState.selected?.children ?? const <CategoryView>[];

    return CustomScrollView(
      controller: _scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        // Fixed reservation for the overlaid header — never changes, so
        // nothing below it moves when the bar hides.
        SliverToBoxAdapter(child: SizedBox(height: headerHeight)),

        // The header comes from its own request, so it gets its own loading
        // state instead of leaving the top of the screen blank.
        if (categoriesState.selected == null &&
            categoriesState.detailStatus != CategoriesStatus.networkError)
          const SliverToBoxAdapter(child: CategoryHeaderSkeleton()),

        // if (categoriesState.selected != null)
        //   SliverToBoxAdapter(
        //     child: _Breadcrumb(result: categoriesState.selected!),
        //   ),
        if (children.isNotEmpty) ...[
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 8.h),
            sliver: SliverToBoxAdapter(
              child: Text(
                context.tr('catalog_subcategories_section'),
                style: context.textStyles.smBold,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 118.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: children.length,
                separatorBuilder: (_, _) => horizontalSpace(10),
                itemBuilder: (context, index) {
                  final child = children[index];
                  return SizedBox(
                    width: 108.w,
                    child: CategoryGridCard(
                      category: child,
                      onTap: () => context.pushNamed(
                        Routes.catalogCategoryScreen,
                        arguments: {'idOrSlug': child.slug, 'name': child.name},
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],

        SliverPadding(
          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 8.h),
          sliver: SliverToBoxAdapter(
            child: ProductFilterBar(
              state: productsState,
              onFilters: () => openProductFilters(context, productsState),
              onSort: () => openProductSort(context, productsState),
            ),
          ),
        ),

        if (productsState.query.hasFilters)
          SliverPadding(
            padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 8.h),
            sliver: SliverToBoxAdapter(
              child: AppliedFilterPills(state: productsState),
            ),
          ),

        ..._buildResults(context, productsState),

        SliverToBoxAdapter(
          child: SizedBox(
            // A pushed route, so it covers the tab bar and only owes the
            // device's own bottom inset — plus room for the paging spinner.
            height:
                (productsState.isLoadingMore ? 60.h : 24.h) +
                MediaQuery.paddingOf(context).bottom,
            child: productsState.isLoadingMore
                ? Center(
                    child: SizedBox(
                      width: 22.w,
                      height: 22.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: context.colors.brand500,
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildResults(BuildContext context, ProductsState state) {
    switch (state.status) {
      case ProductsStatus.initial:
      case ProductsStatus.loading:
        return [
          SliverToBoxAdapter(
            child: CatalogGridSkeleton(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
            ),
          ),
        ];

      case ProductsStatus.catalogUnavailable:
        return [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: EmptyState(
                icon: Icons.cloud_off_outlined,
                title: context.tr('catalog_unavailable_title'),
                subtitle: context.tr('catalog_unavailable_subtitle'),
              ),
            ),
          ),
        ];

      case ProductsStatus.networkError:
        return [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: EmptyState(
                icon: Icons.wifi_off_rounded,
                title: context.tr('error_unexpected'),
                subtitle: state.errorMessage,
              ),
            ),
          ),
        ];

      case ProductsStatus.empty:
        return [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: Column(
                children: [
                  EmptyState(
                    icon: Icons.search_off_outlined,
                    title: context.tr('catalog_no_results_title'),
                    subtitle: state.isEmptyWithFilters
                        ? context.tr('catalog_no_results_filters')
                        : context.tr('catalog_no_results_subtitle'),
                  ),
                  if (state.isEmptyWithFilters) ...[
                    verticalSpace(12.h),
                    PressableScale(
                      onTap: () => context.read<ProductsBloc>().add(
                        const ProductsEvent.filtersCleared(),
                      ),
                      child: Text(
                        context.tr('catalog_filters_clear_all'),
                        style: context.textStyles.smBold.copyWith(
                          color: context.colors.brand600,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ];

      case ProductsStatus.loaded:
        return [
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
                  onTap: () => context.pushNamed(
                    Routes.productDetailScreen,
                    arguments: {'idOrSlug': product.slug},
                  ),
                );
              }, childCount: state.products.length),
            ),
          ),
        ];
    }
  }
}

class _CategoryAppBar extends StatelessWidget {
  final Localized? fallbackName;

  const _CategoryAppBar({this.fallbackName});

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CategoriesBloc>().state.selected;
    final title =
        selected?.category.name.resolve(context) ??
        fallbackName?.resolve(context) ??
        context.tr('catalog_title');

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          _IconButton(
            icon: Icons.arrow_back_rounded,
            onTap: () => context.pop(),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.baseBold,
            ),
          ),
          _IconButton(
            icon: Icons.search_rounded,
            onTap: () => context.pushNamed(Routes.catalogSearchScreen),
          ),
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _IconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: onTap,
      child: Container(
        width: 36.w,
        height: 36.w,
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.field),
        ),
        child: Icon(icon, size: 18.sp, color: colors.textColor),
      ),
    );
  }
}

/// §7.6 — `breadcrumb` holds **ancestors only**; the category itself is
/// stripped server-side, so it is appended here to render the full trail.
class _Breadcrumb extends StatelessWidget {
  final GetCategoryResultView result;

  const _Breadcrumb({required this.result});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final trail = [...result.breadcrumb, result.category];
    return SizedBox(
      height: 30.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        itemCount: trail.length,
        itemBuilder: (context, index) {
          final node = trail[index];
          final isLast = index == trail.length - 1;
          return Row(
            children: [
              Text(
                node.name.resolve(context),
                style: context.textStyles.xsMedium.copyWith(
                  color: isLast ? colors.textColor : colors.ink400,
                  fontWeight: isLast ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
              if (!isLast)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    size: 14.sp,
                    color: colors.ink300,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
