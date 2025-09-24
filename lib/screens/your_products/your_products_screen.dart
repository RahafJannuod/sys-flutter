import 'package:flutter/material.dart';

class YourProductsScreen extends StatelessWidget {
  const YourProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inventory_outlined, size: 64),
            SizedBox(height: 16),
            Text('Your Products Screen'),
            SizedBox(height: 8),
            Text('This screen will show user\'s listed products'),
          ],
        ),
      ),
    );
  }
}