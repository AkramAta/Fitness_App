import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

// Sliding Animation
Widget buildAnimatedTextFormField({
  required TextEditingController controller,
  String hintText = "Enter text",
  String labelText = "Label",
  double fontSize = 20,
  String initialValue = "",
  Color textColor = Colors.white,
  Color fillColor = Colors.black,
  Color borderColor = Colors.grey,
  Color focusedBorderColor = Colors.grey,
  EdgeInsets contentPadding = const EdgeInsets.all(20),
  Duration animationDuration = const Duration(seconds: 1),
  Duration delayDuration = const Duration(milliseconds: 500),
  Offset animationBeginOffset = const Offset(-1, 0),
  double borderWidth = 2.0,
  double textPadding = 10.0,
}) {
  return Animate(
    effects: [
      SlideEffect(
        curve: Curves.easeInOut,
        begin: animationBeginOffset,
        delay: delayDuration,
        duration: animationDuration,
      )
    ],
    child: Padding(
      padding: EdgeInsets.all(textPadding),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
        ),
        decoration: InputDecoration(
          filled: true,
          labelStyle: TextStyle(color: Colors.grey),
          fillColor: fillColor,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: borderWidth, color: fillColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: borderWidth, color: fillColor),
          ),
          hintText: hintText,
          contentPadding: contentPadding,
          labelText: labelText,
        ),
      ),
    ),
  );
}
