import 'package:flutter/material.dart';

Widget buildTextFormField({
  required TextEditingController controller,
  required bool obSecured_text,
  required Widget suffixIcon,
  required String hintText,
  required String labelText,
  Color iconColor = Colors.white10,
  Color borderColor = Colors.grey,
  Color focusedBorderColor = Colors.deepPurple,
  Color textColor = Colors.white,
  Color fillColor = Colors.black,
  EdgeInsets contentPadding = const EdgeInsets.all(20),
  double fontSize = 20,
  double borderWidth = 1,
  Color labelColor = Colors.white, // Direct Color instead of String
  void Function(String)? onChanged,
  void Function()? onTap,
  FocusNode? focusNode,
}) {
  return Focus(
    focusNode: focusNode,
    child: TextFormField(
      controller: controller,
      obscureText: obSecured_text,
      style: TextStyle(fontSize: fontSize, color: textColor),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: suffixIcon,
          color: focusNode?.hasFocus == true ? Colors.blue : iconColor, // Change icon color based on focus
          onPressed: () {
            // Handle icon button press
          },
        ),
        filled: true,
        labelStyle: TextStyle(color: labelColor),
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: borderWidth, color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: borderWidth, color: focusedBorderColor),
        ),
        hintText: hintText,
        contentPadding: contentPadding,
        labelText: labelText,
      ),
      onTap: onTap,
      onChanged: onChanged,
    ),
  );
}