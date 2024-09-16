
import 'package:flutter/material.dart';
Widget buildContainerWithBorder({
  required Widget child,
  required double borderWidth ,
  required borderColor ,
  required double borderRadius ,
  required double Margin_top_and_bottom,
}) {
  return Container(
    margin: EdgeInsets.only(
      top: Margin_top_and_bottom,
      bottom: Margin_top_and_bottom
    ),
    decoration: BoxDecoration(
      border: Border.all(
        width: borderWidth,
        color: borderColor,
      ),
      borderRadius: BorderRadius.circular(borderRadius),
    ),
    child: child,
  );
}
