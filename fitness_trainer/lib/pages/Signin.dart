import 'package:finalproject/Component/Colors.dart';
import 'package:finalproject/Component/Paragraphs.dart';
import 'package:finalproject/Component/Title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../Component/Button.dart';

class Signin extends StatelessWidget {
  late List logos = [
    {
      "img": "Assets/Image/Facebook.png",
      "message": "Continue with Facebook",
      "Delay": 250
    },
    {
      "img": "Assets/Image/Google.png",
      "message": "Continue with Google",
      "Delay": 500
    },
    {
      "img": "Assets/Image/Apple.png",
      "message": "Continue with Apple",
      "Delay": 750
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Icon(
            Icons.arrow_back,
            color: Color(int.parse(White)),
          ),
          backgroundColor: Color(int.parse(Black))),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(int.parse(Black)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Animate(
                  child: titles(
                    txt: "Let's you in",
                  ),
                  effects: [FadeEffect(duration: Duration(seconds: 3))],
                )),
            for (int i = 0; i < logos.length; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.black,
                  margin:
                      EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 50),
                  child: Animate(
                    effects: [
                      FadeEffect(
                          duration: Duration(seconds: 3),
                          delay: Duration(milliseconds: logos[i]["Delay"]))
                    ],
                    child: ListTile(
                      title: Text(
                        logos[i]["message"],
                        style: TextStyle(color: Color(int.parse(White))),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 20,
                        backgroundImage: AssetImage(logos[i]["img"]),
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(height: 40), // Adjust the space above the dividers
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Color(int.parse(Grayish)),
                    thickness: 2,
                    indent: 20,
                    endIndent: 10,
                  ),
                ),
                Text(
                  "OR",
                  style: TextStyle(
                    color: Color(int.parse(White)),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Color(int.parse(Grayish)),
                    thickness: 2,
                    indent: 10,
                    endIndent: 20,
                  ),
                ),
              ],
            ),
            Animate(
              effects: [
                FadeEffect(
                    delay: Duration(seconds: 1), duration: Duration(seconds: 4))
              ],
              child: Padding(
                padding: EdgeInsets.all(20),
                child: buttons(text: "sign in with password", action: () {}),
              ),
            ),
            SizedBox(height: 120),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              paragraph(
                  text: "Don't have an account ? ",
                  color: Color(int.parse(Grayish))),
              paragraph(text: "sigin in", color: Color(int.parse(Purple)))
            ])
          ],
        ),
      ),
    );
  }
}
