import 'package:flutter/material.dart';

Widget titles({required String txt, TextAlign text_Align = TextAlign.center}) {
  return Text(
    txt,
    style: const TextStyle(
      color: Colors.white,
      fontFamily: "lora",
      fontSize: 50,
      fontWeight: FontWeight.w600,
    ),
    textAlign: text_Align,
  );
}
