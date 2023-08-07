import 'package:flutter/material.dart';
import 'package:todo_flutter/common/constants/button-variant/button-variant.constants.dart';
import 'package:todo_flutter/common/widgets/button/button.widget.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'Welcome TODO App',
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 36),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              label: 'Login',
              width: 300,
              variant: ButtonVariant.primary,
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),

            CustomButton(
              width: 300,
              label: 'Sign up',
              variant: ButtonVariant.secondary,
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
            ),
          ],
        )
      ]),
    );
  }
}
