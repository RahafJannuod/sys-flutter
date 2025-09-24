import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_box_outlined, size: 64),
            SizedBox(height: 16),
            Text('Add Product Screen'),
            SizedBox(height: 8),
            Text('This screen will have a form to add new products'),
          ],
        ),
      ),
    );
  }
}