import 'package:flutter/material.dart';
import '../design_system/colors/app_colors.dart';
import '../design_system/spacing/app_spacing.dart';
import '../shared_components/modern_navigation_bar.dart';
import '../shared_components/modern_search_bar.dart';
import '../shared_components/modern_filter_dropdown.dart';
import '../shared_components/filter_action_buttons.dart';
import '../shared_components/modern_product_card.dart';
import '../shared_components/hamburger_dropdown.dart';

class ModernEcommerceScreen extends StatefulWidget {
  const ModernEcommerceScreen({super.key});

  @override
  State<ModernEcommerceScreen> createState() => _ModernEcommerceScreenState();
}

class _ModernEcommerceScreenState extends State<ModernEcommerceScreen> {
  String? selectedLocation;
  String? selectedCategory;
  String? selectedPriceRange;
  String? selectedItemType;
  String? selectedCondition;
  bool _isMenuVisible = false;

  // Sample data for dropdowns
  final List<String> locations = [
    'Riyadh, Saudi Arabia',
    'Jeddah, Saudi Arabia',
    'Dammam, Saudi Arabia',
    'Makkah, Saudi Arabia',
    'Madinah, Saudi Arabia',
  ];

  final List<String> categories = [
    'All',
    'Gifts & Exchange',
    'Homemade Pantry',
    'Handmade Crafts',
    'Car, Bicycle & Boat',
    'Services',
    'Admission Tickets & Tickets',
    'Electronics',
    'Family & Child',
    'Leisure, Hobbies & Surroundings',
    'Home & Garden',
    'Pets',
    'Property',
    'Jobs',
    'Fashion & Beauty',
    'Music, Movies & Books',
    'Live Help',
    'Lessons & Courses',
  ];

  final List<String> priceRanges = [
    'Under SAR 100',
    'SAR 100 - 500',
    'SAR 500 - 1,000',
    'SAR 1,000 - 5,000',
    'Above SAR 5,000',
  ];

  final List<String> itemTypes = [
    'New',
    'Used - Like New',
    'Used - Good',
    'Used - Fair',
    'For Parts',
  ];

  final List<String> conditions = [
    'Excellent',
    'Good',
    'Fair',
    'Poor',
  ];

  // Sample products data
  final List<Map<String, dynamic>> products = [
    {
      'title': 'iPhone 14 Pro Max',
      'price': 'SAR 4,200',
      'location': 'Riyadh, Saudi Arabia',
      'imageUrl': '',
      'isFavorite': false,
    },
    {
      'title': 'Samsung Galaxy S23 Ultra',
      'price': 'SAR 3,800',
      'location': 'Jeddah, Saudi Arabia',
      'imageUrl': '',
      'isFavorite': true,
    },
    {
      'title': 'MacBook Air M2',
      'price': 'SAR 5,500',
      'location': 'Dammam, Saudi Arabia',
      'imageUrl': '',
      'isFavorite': false,
    },
    {
      'title': 'PlayStation 5',
      'price': 'SAR 2,100',
      'location': 'Riyadh, Saudi Arabia',
      'imageUrl': '',
      'isFavorite': false,
    },
  ];

  void _clearFilters() {
    setState(() {
      selectedLocation = null;
      selectedCategory = null;
      selectedPriceRange = null;
      selectedItemType = null;
      selectedCondition = null;
    });
  }

  void _applyFilters() {
    // Implement filter logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Filters applied successfully!'),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  void _toggleMenu() {
    setState(() {
      _isMenuVisible = !_isMenuVisible;
    });
  }

  void _closeMenu() {
    setState(() {
      _isMenuVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.backgroundLight,
          appBar: ModernNavigationBar(
            onMenuTap: _toggleMenu,
          ),
      body: Column(
        children: [
          // Search Bar
          ModernSearchBar(
            onChanged: (value) {
              // Handle search
            },
            onSubmitted: (value) {
              // Handle search submission
            },
          ),

          // First Row of Filters
          FilterDropdownRow(
            dropdowns: [
              ModernFilterDropdown(
                hint: 'Select Location',
                items: locations,
                value: selectedLocation,
                prefixIcon: Icons.location_on_outlined,
                onChanged: (value) {
                  setState(() {
                    selectedLocation = value;
                  });
                },
              ),
              ModernFilterDropdown(
                hint: 'Category',
                items: categories,
                value: selectedCategory,
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value;
                  });
                },
              ),
            ],
          ),

          // Second Row of Filters
          FilterDropdownRow(
            dropdowns: [
              ModernFilterDropdown(
                hint: 'Price Range',
                items: priceRanges,
                value: selectedPriceRange,
                onChanged: (value) {
                  setState(() {
                    selectedPriceRange = value;
                  });
                },
              ),
              ModernFilterDropdown(
                hint: 'Item Type',
                items: itemTypes,
                value: selectedItemType,
                onChanged: (value) {
                  setState(() {
                    selectedItemType = value;
                  });
                },
              ),
              ModernFilterDropdown(
                hint: 'Condition',
                items: conditions,
                value: selectedCondition,
                onChanged: (value) {
                  setState(() {
                    selectedCondition = value;
                  });
                },
              ),
            ],
          ),

          // Filter Action Buttons
          FilterActionButtons(
            onClearFilters: _clearFilters,
            onApplyFilters: _applyFilters,
          ),

          // Products Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.m),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: AppSpacing.m,
                  mainAxisSpacing: AppSpacing.m,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ModernProductCard(
                    imageUrl: product['imageUrl'],
                    title: product['title'],
                    price: product['price'],
                    location: product['location'],
                    isFavorite: product['isFavorite'],
                    onFavoriteToggle: () {
                      setState(() {
                        products[index]['isFavorite'] = !product['isFavorite'];
                      });
                    },
                    onTap: () {
                      // Navigate to product details
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
        ),

        // Hamburger Dropdown
        HamburgerDropdown(
          isVisible: _isMenuVisible,
          onClose: _closeMenu,
          onProfileTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile tapped')),
            );
          },
          onSettingsTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Settings tapped')),
            );
          },
          onSignOutTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Sign out tapped')),
            );
          },
        ),
      ],
    );
  }
}