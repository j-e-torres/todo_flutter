import 'package:flutter/material.dart';
import 'package:todo_flutter/common/widgets/__test/__test.widget.dart';

class CustomFormField extends StatelessWidget {
  final String labelText;
  final TextStyle labelStyle;
  final String hintText;
  final TextStyle hintStyle;
  final UnderlineInputBorder enabledBorder;
  final UnderlineInputBorder focusedBorder;
  final String validatorRequiredMsg;
  final bool obscureText;
  final TextEditingController controller;

  final double marginBottom;
  final double marginTop;

  const CustomFormField({
    super.key,
    this.labelText = 'someLabel',
    this.validatorRequiredMsg = 'some required msg',
    this.labelStyle = const TextStyle(
      color: Colors.orange,
    ),
    this.hintText = 'some hint text',
    this.hintStyle = const TextStyle(
      color: Colors.black26,
    ),
    this.enabledBorder = const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.orange,
      ),
    ),
    this.focusedBorder = const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.orange,
      ),
    ),
    this.marginBottom = 12,
    this.marginTop = 0.0,
    this.obscureText = false,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: marginBottom, top: marginTop),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: labelStyle,
          hintText: hintText,
          hintStyle: hintStyle,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorRequiredMsg;
          }
          return null;
        },
      ),
    );
  }
}
