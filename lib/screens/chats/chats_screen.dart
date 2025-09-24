import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat_bubble_outline, size: 64),
            SizedBox(height: 16),
            Text('Chats Screen'),
            SizedBox(height: 8),
            Text('This screen will show all conversations'),
          ],
        ),
      ),
    );
  }
}