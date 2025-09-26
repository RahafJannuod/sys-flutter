import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/products/products_bloc.dart';
import '../../core/config/app_config.dart';
import '../../core/localization/app_localizations.dart';
import '../../design_system/colors/app_colors.dart';
import '../../design_system/spacing/app_spacing.dart';
import '../../design_system/typography/app_typography.dart';
import '../../shared_components/modern_navigation_bar.dart';
import '../../shared_components/modern_search_bar.dart';
import '../../shared_components/modern_filter_dropdown.dart';
import '../../shared_components/filter_action_buttons.dart';
import '../../shared_components/modern_product_card.dart';
import 'components/category_selector.dart';
import 'components/product_grid.dart';
import 'components/search_bar.dart';
import 'components/location_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts({bool refresh = false}) {
    context.read<ProductsBloc>().add(
          ProductsLoadRequested(
            category: _selectedCategory,
            refresh: refresh,
          ),
        );
  }

  void _onCategorySelected(String? category) {
    setState(() {
      _selectedCategory = category;
    });
    _loadProducts();
  }

  void _onSearchSubmitted(String query) {
    // TODO: Implement search functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Search: $query')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations.appName,
          style: AppTypography.englishTitleLarge.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => _loadProducts(refresh: true),
        child: CustomScrollView(
          slivers: [
            // Location Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.screenPadding),
                child: LocationHeader(
                  onLocationTap: () {
                    // TODO: Implement location selection
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Location selection will be implemented')),
                    );
                  },
                ),
              ),
            ),

            // Search Bar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding,
                ),
                child: HomeSearchBar(
                  onSearchSubmitted: _onSearchSubmitted,
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.l),
            ),

            // Category Selector
            SliverToBoxAdapter(
              child: CategorySelector(
                categories: AppConfig.productCategories,
                selectedCategory: _selectedCategory,
                onCategorySelected: _onCategorySelected,
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.l),
            ),

            // Products Grid
            BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(AppSpacing.xxxl),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  );
                }

                if (state is ProductsError) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.xxxl),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.error_outline,
                              size: 64,
                              color: AppColors.error,
                            ),
                            const SizedBox(height: AppSpacing.l),
                            const Text(
                              'Error loading products',
                              style: AppTypography.englishTitleMedium,
                            ),
                            const SizedBox(height: AppSpacing.s),
                            Text(
                              state.message,
                              style: AppTypography.englishBodyMedium.copyWith(
                                color: AppColors.textSecondary,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppSpacing.l),
                            ElevatedButton(
                              onPressed: () => _loadProducts(refresh: true),
                              child: Text(localizations.tryAgain),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }

                if (state is ProductsLoaded) {
                  if (state.products.isEmpty) {
                    return SliverToBoxAdapter(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(AppSpacing.xxxl),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.inventory_outlined,
                                size: 64,
                                color: AppColors.neutral500,
                              ),
                              const SizedBox(height: AppSpacing.l),
                              const Text(
                                'No products found',
                                style: AppTypography.englishTitleMedium,
                              ),
                              const SizedBox(height: AppSpacing.s),
                              Text(
                                _selectedCategory != null
                                    ? 'No products in this category yet'
                                    : 'Be the first to add a product!',
                                style: AppTypography.englishBodyMedium.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                  return ProductGrid(products: state.products);
                }

                // Initial state - show loading
                return const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(AppSpacing.xxxl),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              },
            ),

            // Bottom padding for FAB
            const SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.xxxxxl),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Navigate to add product screen
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Add product screen will be implemented')),
          );
        },
        icon: const Icon(Icons.add),
        label: Text(localizations.addProduct),
        backgroundColor: AppColors.secondary,
        foregroundColor: Colors.white,
      ),
    );
  }
}
