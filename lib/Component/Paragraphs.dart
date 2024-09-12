import 'package:flutter/material.dart';

Widget paragraph(
    {
      double Font_size = 10,
      required String text,
      Color color = Colors.white,
      TextAlign  = TextAlign.center
    }) {
  return Text(
    text,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      fontFamily: "lora",
      fontSize: Font_size,
      color: color,
    ),
    textAlign: TextAlign,
  );
}
