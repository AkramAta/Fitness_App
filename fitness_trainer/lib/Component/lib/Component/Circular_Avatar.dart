import 'package:flutter/material.dart';

// Define a function to create a CircleAvatar with specified properties
Widget buildCircleAvatar(
    {Color Bg_Color = Colors.red,
    double Radius_value = 20,
    required Widget Child}) {
  return CircleAvatar(
      backgroundColor: Bg_Color, radius: Radius_value, child: Child);
}
