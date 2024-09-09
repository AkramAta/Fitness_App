import 'package:finalproject/pages/Age_picker.dart';
import 'package:finalproject/pages/Fill%20Profile.dart';
import 'package:finalproject/pages/Login.dart';
import 'package:finalproject/pages/Register.dart';
import 'package:flutter/material.dart';
import 'pages/Height_picker.dart';
import 'pages/Physical_activity.dart';
import 'pages/Weight-picker.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhysicalActivity(),
    );
  }
}
