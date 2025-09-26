import 'package:flutter/material.dart';
import '../design_system/colors/app_colors.dart';
import '../design_system/typography/app_typography.dart';
import '../design_system/spacing/app_spacing.dart';

class ModernProductCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String location;
  final bool isFavorite;
  final VoidCallback? onFavoriteToggle;
  final VoidCallback? onTap;

  const ModernProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.location,
    this.isFavorite = false,
    this.onFavoriteToggle,
    this.onTap,
  });

  @override
  State<ModernProductCard> createState() => _ModernProductCardState();
}

class _ModernProductCardState extends State<ModernProductCard> {
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    widget.onFavoriteToggle?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          border: Border.all(
            color: AppColors.cardBorder,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: 8,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with Heart Icon Overlay
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSpacing.radiusM),
                topRight: Radius.circular(AppSpacing.radiusM),
              ),
              child: Stack(
                children: [
                  // Product Image
                  AspectRatio(
                    aspectRatio: 1.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.backgroundSecondary,
                      ),
                      child: widget.imageUrl.isNotEmpty
                          ? Image.network(
                              widget.imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 48,
                                    color: AppColors.neutral400,
                                  ),
                                );
                              },
                            )
                          : const Center(
                              child: Icon(
                                Icons.image_outlined,
                                size: 48,
                                color: AppColors.neutral400,
                              ),
                            ),
                    ),
                  ),
                  // Heart Icon (Top Right)
                  Positioned(
                    top: AppSpacing.s,
                    right: AppSpacing.s,
                    child: GestureDetector(
                      onTap: _toggleFavorite,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.9),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          _isFavorite ? Icons.favorite : Icons.favorite_border,
                          size: 18,
                          color: _isFavorite ? AppColors.primary : AppColors.neutral600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Product Details
            Padding(
              padding: const EdgeInsets.all(AppSpacing.m),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Title
                  Text(
                    widget.title,
                    style: AppTypography.productName.copyWith(
                      color: AppColors.textPrimary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: AppSpacing.xs),

                  // Price
                  Text(
                    widget.price,
                    style: AppTypography.productPrice.copyWith(
                      color: AppColors.textPrice,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xs),

                  // Location
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: AppColors.neutral500,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          widget.location,
                          style: AppTypography.locationText.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}