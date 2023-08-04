import 'package:flutter/material.dart';
import 'package:todo_flutter/common/constants/button-variant/button-variant.constants.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;
  // final Color color;
  final ButtonVariant variant;

  const CustomButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.width = 200,
      // this.color = Colors.blue
      // required this.color,
      this.variant = ButtonVariant.primary});

  static final ButtonStyle _sharedStyles = ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(12),
    // Add any other shared styles here
  );

  static final Map<ButtonVariant, ButtonStyle> _variantStyles = {
    ButtonVariant.primary: ElevatedButton.styleFrom(
      backgroundColor: Colors.orange,
    ).merge(_sharedStyles),
    ButtonVariant.secondary: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
    ).merge(_sharedStyles),
    ButtonVariant.success: ElevatedButton.styleFrom(
      backgroundColor: Colors.green,
    ).merge(_sharedStyles),
    ButtonVariant.danger: ElevatedButton.styleFrom(
      backgroundColor: Colors.red,
    ).merge(_sharedStyles),
  };

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = _variantStyles[variant] as ButtonStyle;
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        // style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
        style: buttonStyle,
        child: Text(
          label,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
