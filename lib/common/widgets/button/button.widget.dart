import 'package:flutter/material.dart';
import 'package:todo_flutter/common/constants/button-variant/button-variant.constants.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;
  final double marginBottom;
  final double marginTop;
  final ButtonVariant variant;

  const CustomButton(
      {super.key,
      required this.label,
      required this.onPressed,
      this.width = 300,
      this.marginBottom = 12,
      this.marginTop = 0,
      this.variant = ButtonVariant.primary});

  static final ButtonStyle _sharedStyles = ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(16),
      side: const BorderSide(width: 1, color: Colors.orange)
      // Add any other shared styles here
      );

  static final Map<ButtonVariant, VariantStyle> _variantStyles = {
    ButtonVariant.primary: VariantStyle(
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
      ).merge(_sharedStyles),
      textColor: Colors.white,
    ),
    ButtonVariant.secondary: VariantStyle(
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
      ).merge(_sharedStyles),
      textColor: Colors.orange,
    ),
    ButtonVariant.success: VariantStyle(
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ).merge(_sharedStyles),
      textColor: Colors.white,
    ),
    ButtonVariant.danger: VariantStyle(
      buttonStyle: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
      ).merge(_sharedStyles),
      textColor: Colors.white,
    ),
  };

  @override
  Widget build(BuildContext context) {
    final VariantStyle variantStyle =
        _variantStyles[variant]!; // Default value will always be primary

    final TextStyle textStyle = TextStyle(
      fontSize: 20,
      color: variantStyle.textColor,
    );

    return Padding(
      padding: EdgeInsets.only(bottom: marginBottom, top: marginTop),
      child: SizedBox(
        width: width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: variantStyle.buttonStyle,
          child: Text(
            label,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}

class VariantStyle {
  final ButtonStyle buttonStyle;
  final Color textColor;

  VariantStyle({required this.buttonStyle, required this.textColor});
}
