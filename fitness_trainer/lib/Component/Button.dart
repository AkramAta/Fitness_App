import 'package:flutter/material.dart';

import 'Colors.dart'; // Assuming 'Purple' and 'White' are defined in Colors.dart

Widget buttons({
  required String text,
  required Function() action,
  Color colour = const Color(0xff6C63FF), // Default color
}) {
  return TextButton(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      foregroundColor: MaterialStateProperty.all(Color(int.parse(White))),
      backgroundColor: MaterialStateProperty.all(colour),
      padding: MaterialStateProperty.all(
        EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      ),
    ),
    onPressed: action,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 30,
        fontFamily: 'lora',
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
