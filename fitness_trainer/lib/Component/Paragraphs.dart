import 'package:flutter/material.dart';

Widget paragraph(
  
    { TextAlign TextAlign= TextAlign.start,double Font_size = 10, required String text, Color color = Colors.white}) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      fontFamily: "lora",
      fontSize: Font_size,
      color: color,
    ),
  );
}
