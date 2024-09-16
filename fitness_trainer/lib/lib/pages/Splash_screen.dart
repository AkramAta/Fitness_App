import 'dart:async';

import 'package:finalproject/Component/Title.dart';
import 'package:finalproject/pages/Welcome%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Component/Colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => WelcomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse(Purple)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(int.parse(Purple)),
              ),
              padding: EdgeInsets.all(1),
              child: IconButton(
                onPressed: () {},
                icon: FaIcon(
                  FontAwesomeIcons.dumbbell,
                  color: Color(int.parse(White)),
                  size: 70,
                ),
              ),
            ),
            SizedBox(height: 20),
            titles(txt: "GoFit")
          ],
        ),
      ),
    );
  }
}