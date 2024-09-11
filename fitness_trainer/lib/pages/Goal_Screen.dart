import 'package:finalproject/Component/Colors.dart';
import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/buid_container.dart';
import 'package:flutter/material.dart';
import '../Component/Build_ContainerWith_Border.dart';
import '../Component/Button.dart';
import '../Component/Paragraphs.dart';
import '../Component/Title.dart';

class GoalScreen extends StatefulWidget {
  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  late List<String> paragraphs;
  late List<String> goalsTargets;
  late List<bool> isCheckedList;
  late String containerBorderColor;

  @override
  void initState() {
    super.initState();
    // Initialize the lists and variables
    paragraphs = [
      "You can choose more than one, don't worry",
      "You can always change it later"
    ];
    goalsTargets = [
      "Get Fitter",
      "Gain Weight",
      "Lose Weight",
      "Building Muscles",
      "Improving Endurance",
      "Others"
    ]; //
    isCheckedList = List<bool>.filled(goalsTargets.length, false);
    containerBorderColor = White; // Initial color for the container border
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
      ),
      body: buildContainer(
        padding_All_direction: 10,
        backgroundColor: Color(int.parse(Black)),
        child: Column(
          children: [
            titles(txt: "What's your goal?", Font_size: 30),
            Sized_Gap(Height: 15),
            for (int i = 0; i < paragraphs.length; i++)
              paragraph(text: paragraphs[i], Font_size: 20),
            Sized_Gap(Height: 30),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(
                  left: 10,right: 10
                ),
                itemCount: goalsTargets.length,
                itemBuilder: (context, index) {
                  // Determine border color based on the checkbox state
                  String currentBorderColor = isCheckedList[index] ? Purple : White;
                  return buildContainerWithBorder(

                    Margin_top_and_bottom: 15,
                    borderWidth: 1,
                    borderRadius: 10,
                    borderColor: Color(int.parse(currentBorderColor)),
                    child: CheckboxListTile(
                      title: titles(
                          txt: goalsTargets[index],
                          Font_size: 25,
                          text_Align: TextAlign.left),
                      value: isCheckedList[index],
                      onChanged: (bool? value) {
                        setState(() {
                          isCheckedList[index] = value!;
                          // Optionally update containerBorderColor based on some criteria
                          // if you need to change the overall border color based on the state
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            Sized_Gap(Height: 20),
            Container(
              padding: EdgeInsets.only(
                  top:10, bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttons(
                      text: "Back",
                      colour: Color(int.parse(Grayish)),
                      action: () {},
                      Pad_Left_Right: 80,
                      Font_size: 20
                  ),
                  buttons(
                      text: "Continue",
                      action: () {},
                      Pad_Left_Right: 50,
                      Font_size: 20
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}