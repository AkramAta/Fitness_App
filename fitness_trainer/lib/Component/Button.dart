import 'package:flutter/material.dart';

import "Colors.dart";

Widget buttons({
  required String text,
  required Function() action,
}) {
  return TextButton(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      foregroundColor: WidgetStatePropertyAll(Color(int.parse(White))),
      backgroundColor: WidgetStateProperty.all(Color((int.parse(Purple)))),
      padding: WidgetStatePropertyAll(
          EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10)),
    ),
    onPressed: action,
    child: Text(text,
        style: const TextStyle(
          fontSize: 30,
          fontFamily: "lora",
          fontWeight: FontWeight.w500,
        )),
  );
}
