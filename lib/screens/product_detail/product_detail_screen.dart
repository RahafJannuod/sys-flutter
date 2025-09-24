import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_bag_outlined, size: 64),
            const SizedBox(height: 16),
            const Text('Product Detail Screen'),
            const SizedBox(height: 8),
            Text('Product ID: $productId'),
            const SizedBox(height: 16),
            const Text('This screen will be implemented with full product details'),
          ],
        ),
      ),
    );
  }
}