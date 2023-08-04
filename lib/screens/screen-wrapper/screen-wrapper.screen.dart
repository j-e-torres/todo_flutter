import 'package:flutter/material.dart';

class ScreenWrapper extends StatelessWidget {
  final Widget child;

  const ScreenWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Add your default app bar content here (e.g., title, actions).
        title: const Text('TODO FLUTTER'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding:
            // NOTE(juan): padding just for mobile
            const EdgeInsets.all(16.0), // Add default padding to the content.
        child: child, // The content of the current page goes here.
      ),
    );
  }
}
