import 'package:finalproject/Component/Colors.dart';
import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:flutter/material.dart';

import '../Component/Paragraphs.dart';
import '../Component/Title.dart';
class GoalScreen extends StatelessWidget {
  late List <String> paragraphs = [
    "you can choose more than one , Don't worry",
    "you can always change it later "
  ];
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(int.parse(Black)),
    ),
    body: Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(int.parse(Black)),
      child: Column(
        children: [
          titles(txt: "Physical Activity Level ?",Font_size: 30),
          Sized_Gap(Height: 15),
          for(int i =0; i<paragraphs.length; i++)
          paragraph(
          text: paragraphs[i],
          Font_size: 20,
          ),
          Sized_Gap(Height: 20),
          SegmentedButton(
            multiSelectionEnabled: true,
            selected: Set(),
            segments: [
              ButtonSegment(
                value: "String"
              )
            ],
          )
        ],
      ),
    ),
  );
  }
}
