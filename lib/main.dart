import 'package:flutter/material.dart';
import 'package:todo_flutter/screens/login/login.screen.dart';
import 'package:todo_flutter/screens/root/root.screen.dart';
import 'package:todo_flutter/screens/screen-wrapper/screen-wrapper.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xdfe8ec)),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const ScreenWrapper(child: RootScreen()),
        '/login': (context) => const ScreenWrapper(child: LoginScreen()),
        '/signup': (context) => const ScreenWrapper(child: Placeholder()),
        '/home': (context) => const ScreenWrapper(child: Placeholder()),
      },
    );
  }
}
