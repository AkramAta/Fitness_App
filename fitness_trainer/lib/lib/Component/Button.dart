import 'package:flutter/material.dart';

import 'Colors.dart';

Widget buttons({
  required String text,
  required Function() action,
  Color colour = const Color(0xff6C63FF),
  double Font_size = 25,
  double Pad_Left_Right = 30,
  double Pad_Top_Bottom = 15,
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
        EdgeInsets.only(
            left: Pad_Left_Right,
            right: Pad_Left_Right,
            top: Pad_Top_Bottom,
            bottom: Pad_Top_Bottom),
      ),
    ),
    onPressed: action,
    child: Text(
      text,
      style: TextStyle(
        fontSize: Font_size,
        fontFamily: 'lora',
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
