import 'package:finalproject/Component/Button.dart';
import 'package:flutter/material.dart';

import '../Component/Button without child.dart';
import '../Component/Circular_Avatar.dart';
import '../Component/Colors.dart';
import '../Component/Paragraphs.dart';
import '../Component/SizedBox_for Gapping.dart';
import '../Component/Title.dart';
import '../Component/buid_container.dart';

// في حجات كتير انا عاملها كفنكشن ف الكوكومبنت
class TellUs extends StatefulWidget {
  @override
  State<TellUs> createState() => _TellUsState();
}

class _TellUsState extends State<TellUs> {
  late List<String> paragraph_text = [
    "to give you a better experience and results",
    "we need to know your gender"
  ];
  // Define default colors
  late String defaultColor = Grayish;
  late String selectedColor = Purple;
  // Track which button is selected
  late String selectedGender = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
      ),
      body: buildContainer(
        padding_All_direction: 20,
        backgroundColor: Color(int.parse(Black)),
        child: Column(
          children: [
            titles(
              txt: "Tell us about yourself",
              Font_size: 30,
              txt_color: Color(int.parse(White)),
            ),
            Sized_Gap(
              Height: 15,
            ),
            for (int i = 0; i < paragraph_text.length; i++)
              paragraph(text: paragraph_text[i], Font_size: 15),
            Sized_Gap(Height: 30),
            buildEmptyButton(
              onPressed: () {
                setState(() {
                  selectedGender = 'Male';
                });
              },
              Child: buildCircleAvatar(
                Bg_Color: selectedGender == 'Male'
                    ? Color(int.parse(selectedColor))
                    : Color(int.parse(defaultColor)),
                Radius_value: 80,
                Child: buildContainer(
                  backgroundColor: Colors.transparent,
                  padding_All_direction: 30,
                  child: Column(
                    children: [
                      Icon(
                        size: 60,
                        Icons.male,
                        color: Color(int.parse(White)),
                      ),
                      titles(
                        txt: "male",
                        Font_size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Sized_Gap(Height: 30),
            buildEmptyButton(
              onPressed: () {
                setState(() {
                  selectedGender = 'Female';
                });
              },
              Child: buildCircleAvatar(
                // function of component
                Bg_Color: selectedGender == 'Female'
                    ? Color(int.parse(selectedColor))
                    : Color(int.parse(defaultColor)),
                Radius_value: 80,
                Child: buildContainer(
                  backgroundColor: Colors.transparent,
                  padding_All_direction: 30,
                  child: Column(
                    children: [
                      Icon(
                        size: 60,
                        Icons.female,
                        color: Color(int.parse(White)),
                      ),
                      titles(
                        txt: "Female",
                        Font_size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Sized_Gap(Height: 120),
            buttons(text: "Countiune", Pad_Left_Right: 100, action: () {})
          ],
        ),
      ),
    );
  }
}
