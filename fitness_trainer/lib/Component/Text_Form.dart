import 'package:flutter/material.dart';
Widget buildTextFormField({
   Function Changed(String)?,
  Function()? Tapped ,
  required obSecured_text ,
  required TextEditingController controller,
  required Widget suffixIcon ,
  required String hintText ,
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
}) {
  return TextFormField(
    controller: controller,
    obscureText: obSecured_text,
    style: TextStyle(fontSize: fontSize, color: textColor),
    decoration: InputDecoration(
      suffixIcon: suffixIcon,
      suffixIconColor: iconColor,
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
    onTap: Tapped,
    onChanged:Changed
  );
}
