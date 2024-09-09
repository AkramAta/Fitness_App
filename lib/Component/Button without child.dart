import 'package:flutter/material.dart';

Widget buildEmptyButton({
  required Function() onPressed,
  required Widget Child,
}) {
  return TextButton(onPressed: onPressed, child: Child);
}
