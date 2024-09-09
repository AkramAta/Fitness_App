import 'package:flutter/material.dart';

// Define a function to create a Container with specified properties
Widget buildContainer(
    {required Widget child,
    required Color backgroundColor,
    double padding_All_direction = 20}) {
  return Container(
    padding: EdgeInsets.all(padding_All_direction),
    child: child,
    width: double.infinity,
    height: double.infinity,
    color: backgroundColor,
  );
}
