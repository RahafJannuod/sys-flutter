import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 64),
            SizedBox(height: 16),
            Text('Favorites Screen'),
            SizedBox(height: 8),
            Text('This screen will show favorite products'),
          ],
        ),
      ),
    );
  }
}