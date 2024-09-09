import 'package:finalproject/Component/Paragraphs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../Component/Title.dart';

class WelcomeScreen extends StatelessWidget {
  // For padding Controls
  late double padding_Values = 20;
  // List of titles
  late List<String> Titles = ["welcome to", "go fit"];
  WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("Assets/Image/bg.jpg"),
            ),
          ),
        ),
        // Example of using LinearGradient
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.transparent,
                Colors.black.withOpacity(1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        // Content on top of the overlay
        Padding(
            padding: EdgeInsets.only(
                left: padding_Values,
                right: padding_Values,
                top: 20,
                bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // for (int i = 0; i < Titles.length; i++)
                Animate(
                  effects: const [
                    FadeEffect(duration: Duration(seconds: 3)),
                  ],
                  child: titles(txt: Titles[0].toUpperCase()),
                ),
                Animate(
                  effects: const [
                    FadeEffect(
                        delay: Duration(milliseconds: 500),
                        duration: Duration(seconds: 2)),
                  ],
                  child: titles(txt: Titles[1].toUpperCase()),
                ),
                Animate(
                    effects: const [
                      FadeEffect(
                          delay: Duration(milliseconds: 1000),
                          duration: Duration(seconds: 1))
                    ],
                    child: paragraph(
                        text:
                            "We're thrilled to have you here. Go Fit is designed to help you Track workouts, monitor progress, motivate."))
              ],
            )),
      ]),
    );
  }
}
