import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/screens/login/login.screen.dart';
import 'package:todo_flutter/screens/root/root.screen.dart';
import 'package:todo_flutter/screens/screen-wrapper/screen-wrapper.screen.dart';
import 'common/providers/user/facades/user.facade.dart';
import 'common/providers/user/services/user-api.service.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          UserFacade(UserApiService()), // You might need to adapt this
      child: const MyApp(),
    ),
  );
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
