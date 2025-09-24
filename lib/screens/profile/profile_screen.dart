import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_outline, size: 64),
            SizedBox(height: 16),
            Text('Profile Screen'),
            SizedBox(height: 8),
            Text('This screen will show user profile and settings'),
          ],
        ),
      ),
    );
  }
}