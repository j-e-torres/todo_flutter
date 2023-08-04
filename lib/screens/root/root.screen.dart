import 'package:flutter/material.dart';
import 'package:todo_flutter/common/constants/button-variant/button-variant.constants.dart';
import 'package:todo_flutter/common/widgets/button/button.widget.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'Welcome TODO App',
          style: TextStyle(fontSize: 30),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              label: 'Login',
              variant: ButtonVariant.primary,
              onPressed: () {
                print('LOGGEDIN!');
              },
            ),
            CustomButton(
              label: 'Sign up',
              variant: ButtonVariant.secondary,
              onPressed: () {
                print('SIGNEDUP!');
              },
            ),

            // ElevatedButton(
            // onPressed: () {
            //   print('LOGIN!');
            // },
            //   child: const Text('Login'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     print('SIGNUP!');
            //   },
            //   child: const Text('Sign up'),
            //   style: ButtonStyle(

            //   ),
            // ),
          ],
        )
      ]),
    );
  }
}
