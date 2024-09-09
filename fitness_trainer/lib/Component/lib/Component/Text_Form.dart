import 'package:flutter/material.dart';

Widget buildTextFormField({
  required TextEditingController controller,
  String hintText = "Enter text",
  String labelText = "Label",
  IconData suffixIcon = Icons.mail,
  Color iconColor = Colors.white10, // Removed const
  Color borderColor = Colors.grey, // Removed const
  Color focusedBorderColor = Colors.deepPurple, // Removed const
  Color textColor = Colors.white, // Removed const
  Color fillColor = Colors.black, // Removed const
  EdgeInsets contentPadding = const EdgeInsets.all(20), // This can stay const
  double fontSize = 20,
}) {
  return TextFormField(
    controller: controller,
    style: TextStyle(fontSize: fontSize, color: textColor),
    decoration: InputDecoration(
      suffixIcon: Icon(suffixIcon),
      suffixIconColor: iconColor,
      filled: true,
      labelStyle: TextStyle(color: Colors.grey),
      fillColor: fillColor,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: focusedBorderColor),
      ),
      hintText: hintText,
      contentPadding: contentPadding,
      labelText: labelText,
    ),
    onTap: () {
      // Perform any additional actions when tapped
    },
  );
}
