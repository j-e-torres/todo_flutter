import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center, 
        children: [
        Text(
          'Welcome back!',
          style: TextStyle(fontSize: 30),
        ),

      ]),
    );
  }
}
