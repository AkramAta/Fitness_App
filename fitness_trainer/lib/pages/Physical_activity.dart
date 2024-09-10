import 'package:finalproject/Component/Button.dart';
import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/buid_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../Component/Colors.dart';
import '../Component/Paragraphs.dart';
import '../Component/Title.dart';
class PhysicalActivity extends StatefulWidget {
  @override
  State<PhysicalActivity> createState() => _PhysicalActivityState();
}
late String Selected_Level = ""; // Initial button color (Grayish)
class _PhysicalActivityState extends State<PhysicalActivity> {
  late List <String> paragraphs = [
    "Choose your regular activty level this will",
    "help us to personalize plans for you "
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: Color(int.parse(Black)),
      ),
      body: buildContainer(
        backgroundColor: Color(int.parse(Black)),
        child: Column(
          children: [
            Animate(
              effects: [
                FadeEffect(
                  duration: Duration(seconds: 5),
                )
              ],
              child: titles(txt: "Physical Activity Level ?",Font_size: 30),
            ),
            Sized_Gap(Height: 15),
            for(int i =0; i<paragraphs.length; i++)
            Animate(
              effects: [
                FadeEffect(
                    duration: Duration(seconds: 5),
                    delay: Duration(milliseconds: 500))
              ],
              child: paragraph(
                Font_size: 20,
                  text:paragraphs[i],
                  color: Color(int.parse(White))),
            ),
            Sized_Gap(Height: 150),
            Animate(
            effects: [
    FadeEffect(
    duration: Duration(seconds: 5),
    delay: Duration(milliseconds: 250))
    ],
    child:Column(
      children: [
        buttons(
            colour: Selected_Level == "Beginner" ?
            Color(int.parse(Purple)):  Color(int.parse(Grayish)),
            text: "Beginner",
            Pad_Left_Right: 120,
            action: (){
              setState(() {
                Selected_Level = "Beginner"; // Change color to purple when clicked
              });
            }
            ),
        Sized_Gap(Height: 20),
      ],
    ),
            ),
            Sized_Gap(Height: 10),
            Animate(
              effects: [
                FadeEffect(
                    duration: Duration(seconds: 5),
                    delay: Duration(milliseconds: 500))
              ],
              child:buttons(
                  colour: Selected_Level == "intermediate" ?
                    Color(int.parse(Purple)):  Color(int.parse(Grayish)),
                  text: "intermediate",
                  Pad_Left_Right: 100,
                  action: (){
                 setState(() {
                   Selected_Level ="intermediate";
                 });
                    }
              ),
            ),
            Sized_Gap(Height: 30),
             Animate(
              effects: [
                FadeEffect(
                    duration: Duration(seconds: 5),
                    delay: Duration(milliseconds: 500))
              ],
              child: buttons(
                colour:  Selected_Level == "Advanced" ?
                Color(int.parse(Purple)):  Color(int.parse(Grayish)),
                  text: "Advanced",
                  Pad_Left_Right: 115,
                  action: (){
                 setState(() {
                   Selected_Level ="Advanced";
                 });
                  }
              ),
            ),
            Sized_Gap(Height: 120),
            Container(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    buttons(
    text: "Back",
    colour: Color(int.parse(Grayish)),
    action: () {},
    Pad_Left_Right: 80,
    Font_size: 20),
    buttons(
    text: "Continue",
    action: () {},
    Pad_Left_Right:40,
    Font_size: 20
    ),
    ],
    ),
    ),
    ]
        ),
      ),
    );
  }
}