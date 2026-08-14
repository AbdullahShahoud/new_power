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
import '../../logic/categories_bloc/categories_bloc.dart';
import '../../logic/categories_bloc/categories_event.dart';
import '../../logic/categories_bloc/categories_state.dart';
import '../widgets/catalog_skeletons.dart';
import '../widgets/category_tile.dart';
import '../widgets/collapsing_header.dart';

/// The catalogue tab root: search entry + the root categories.
///
/// Renders the tree the rep navigates by. The grid/list switch lives **here
/// and only here** — the product list keeps its grid, where the image is
/// what a rep scans by.
class CatalogHomeScreen extends StatelessWidget {
  const CatalogHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<CategoriesBloc>()..add(const CategoriesEvent.treeRequested()),
      child: const _CatalogHomeView(),
    );
  }
}

class _CatalogHomeView extends StatefulWidget {
  const _CatalogHomeView();

  @override
  State<_CatalogHomeView> createState() => _CatalogHomeViewState();
}

class _CatalogHomeViewState extends State<_CatalogHomeView> {
  final _scrollController = ScrollController();

  static const _headerHeight = 60.0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _openCategory(CategoryView category) {
    // The slug is preferred over the id: it is accepted anywhere `idOrSlug`
    // appears and survives in a deep link.
    context.pushNamed(
      Routes.catalogCategoryScreen,
      arguments: {'idOrSlug': category.slug, 'name': category.name},
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final headerHeight = _headerHeight.h;
    final topPadding = MediaQuery.paddingOf(context).top;

    return Scaffold(
      backgroundColor: colors.page,
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return CollapsingHeader(
            controller: _scrollController,
            height: headerHeight + topPadding,
            backgroundColor: colors.page,
            header: Padding(
              padding: EdgeInsets.only(top: topPadding),
              child: _CatalogAppBar(
                viewMode: state.viewMode,
                onToggleView: () => context.read<CategoriesBloc>().add(
                  const CategoriesEvent.viewModeToggled(),
                ),
              ),
            ),
            child: RefreshIndicator(
              color: colors.brand500,
              onRefresh: () async => context.read<CategoriesBloc>().add(
                const CategoriesEvent.treeRequested(refresh: true),
              ),
              child: _buildBody(
                context,
                state,
                // The scroll view reserves exactly the header's height and
                // never changes it, which is what keeps rows from shifting
                // as the bar fades in and out.
                EdgeInsets.only(top: headerHeight + topPadding),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    CategoriesState state,
    EdgeInsets topInset,
  ) {
    final gridPadding = topInset + EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 24.h);

    switch (state.status) {
      case CategoriesStatus.initial:
      case CategoriesStatus.loading:
        return state.viewMode == CategoryViewMode.grid
            ? CatalogGridSkeleton(padding: gridPadding)
            : CatalogListSkeleton(padding: gridPadding);

      case CategoriesStatus.networkError:
        return ListView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: gridPadding,
          children: [
            verticalSpace(60.h),
            EmptyState(
              icon: state.catalogUnavailable
                  ? Icons.cloud_off_outlined
                  : Icons.wifi_off_rounded,
              // §6.2 — a 503 is server state, not a client error. It says
              // nothing about what the client already holds, so the copy
              // offers a retry instead of implying something went wrong
              // here.
              title: state.catalogUnavailable
                  ? context.tr('catalog_unavailable_title')
                  : context.tr('error_unexpected'),
              subtitle: state.catalogUnavailable
                  ? context.tr('catalog_unavailable_subtitle')
                  : state.errorMessage,
            ),
            verticalSpace(12.h),
            Center(
              child: PressableScale(
                onTap: () => context.read<CategoriesBloc>().add(
                  const CategoriesEvent.treeRequested(refresh: true),
                ),
                child: Text(
                  context.tr('retry'),
                  style: context.textStyles.smBold.copyWith(
                    color: context.colors.brand600,
                  ),
                ),
              ),
            ),
          ],
        );

      case CategoriesStatus.empty:
        return ListView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          padding: gridPadding,
          children: [
            verticalSpace(60.h),
            EmptyState(
              icon: Icons.category_outlined,
              title: context.tr('catalog_empty_title'),
              subtitle: context.tr('catalog_empty_subtitle'),
            ),
          ],
        );

      case CategoriesStatus.loaded:
        return CustomScrollView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: topInset + EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 0),
              sliver: SliverToBoxAdapter(child: const _SearchEntry()),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 8.h),
              sliver: SliverToBoxAdapter(
                child: Text(
                  context.tr('catalog_categories_section'),
                  style: context.textStyles.baseBold,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 24.h),
              sliver: state.viewMode == CategoryViewMode.grid
                  ? SliverGrid(
                      gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12.w,
                            mainAxisSpacing: 12.h,
                            childAspectRatio: 0.92,
                          ),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final category = state.roots[index];
                        return CategoryGridCard(
                          category: category,
                          onTap: () => _openCategory(category),
                        );
                      }, childCount: state.roots.length),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final category = state.roots[index];
                        return CategoryListTile(
                          category: category,
                          onTap: () => _openCategory(category),
                        );
                      }, childCount: state.roots.length),
                    ),
            ),
          ],
        );
    }
  }
}

class _CatalogAppBar extends StatelessWidget {
  final CategoryViewMode viewMode;
  final VoidCallback onToggleView;

  const _CatalogAppBar({required this.viewMode, required this.onToggleView});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            child: Text(
              context.tr('catalog_title'),
              style: context.textStyles.lgBold,
            ),
          ),
          PressableScale(
            onTap: onToggleView,
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(AppRadius.field),
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) => RotationTransition(
                  turns: Tween(begin: 0.85, end: 1.0).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                ),
                child: Icon(
                  viewMode == CategoryViewMode.grid
                      ? Icons.view_list_rounded
                      : Icons.grid_view_rounded,
                  key: ValueKey(viewMode),
                  size: 20.sp,
                  color: colors.textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchEntry extends StatelessWidget {
  const _SearchEntry();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return PressableScale(
      onTap: () => context.pushNamed(Routes.catalogSearchScreen),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.field),
          border: Border.all(color: colors.Color13),
        ),
        child: Row(
          children: [
            Icon(Icons.search, size: 18.sp, color: colors.ink400),
            horizontalSpace(10),
            Text(
              context.tr('catalog_search_hint'),
              style: context.textStyles.smMedium.copyWith(
                color: colors.ink400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
