import 'package:flutter/material.dart';

Widget titles(
    {required String txt,
    TextAlign text_Align = TextAlign.center,
    double Font_size = 40,
    Color txt_color = Colors.white}) {
  return Text(
    txt,
    style: TextStyle(
      color: txt_color,
      fontFamily: "lora",
      fontSize: Font_size,
      fontWeight: FontWeight.w600,
    ),
    textAlign: text_Align,
  );
}
