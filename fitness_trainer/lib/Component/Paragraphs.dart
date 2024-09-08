import 'package:flutter/material.dart';

Widget paragraph({required String text, Color color = Colors.white}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 15,
      color: color,
    ),
  );
}
