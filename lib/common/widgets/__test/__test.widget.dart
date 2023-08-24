import 'package:flutter/material.dart';

// class TestWidget extends StatelessWidget {
//   const TestWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class TestWidget extends Padding {
  final String coolStuff;
  const TestWidget({
    super.key,
    required super.padding,
    super.child,
    this.coolStuff = 'cool'
  });
}
