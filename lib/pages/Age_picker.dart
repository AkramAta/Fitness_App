import 'package:finalproject/Component/Button.dart';
import 'package:finalproject/Component/Paragraphs.dart';
import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/Title.dart';
import 'package:finalproject/Component/buid_container.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import '../Component/Colors.dart';
class Age_Picker extends StatefulWidget {
  @override
  State<Age_Picker> createState() => _Age_PickerState();
}
class _Age_PickerState extends State<Age_Picker> {
  late int Intiat_value_Picker = 50;
  late List<String> Paragraph = [
    "Age in years this will help us to personalize",
    "an exercise program plan that will suit you"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
      ),
      body: buildContainer(
        backgroundColor: Color(int.parse(Black)),
        child: Column(
          children: [
            titles(
              txt: "How old are you",
              Font_size: 30,
              txt_color: Colors.white,
            ),
            for (int i = 0; i < Paragraph.length; i++)
              paragraph(
                text: Paragraph[i],
                Font_size: 15,
              ),
            Sized_Gap(Height: 30),
            Container(
              color: Colors.transparent, // Changed for better visibility
              height: 450,
              width: 550,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberPicker(
                    value: Intiat_value_Picker,
                    minValue: 0,
                    maxValue: 100,
                    axis: Axis.vertical,
                    infiniteLoop: false,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: Color(int.parse(Purple)), width:2),
                        top: BorderSide(
                            color: Color(int.parse(Purple)), width: 2),
                      ),
                    ),
                    selectedTextStyle: TextStyle(
                      fontSize: 35,
                      color: Color(int.parse(Purple)),
                    ),
                    textStyle: TextStyle(
                      fontSize:30,
                      color: Color(int.parse(White)),
                    ),
                    onChanged: (value) => setState(() {
                      Intiat_value_Picker = value;
                      paragraph(text: Intiat_value_Picker.toString());
                    }),
                  ),
                ],
              ),
            ),
            Sized_Gap(Height: 15),
            titles(txt: "Your age is ${Intiat_value_Picker} years old", Font_size: 30),
            Sized_Gap(Height: 10),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buttons(
                      text: "Back",
                      colour: Color(int.parse(Grayish)),
                      action: () {},
                      Pad_Left_Right: 45,
                      Font_size: 20),
                  buttons(
                      text: "Continue",
                      action: () {},
                      Pad_Left_Right: 20,
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