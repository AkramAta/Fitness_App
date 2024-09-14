import 'package:finalproject/Business_Logic/Cubit/User_Cubit.dart';
import 'package:finalproject/Business_Logic/Cubit/User_State.dart';
import 'package:finalproject/Component/Button.dart';
import 'package:finalproject/Component/Paragraphs.dart';
import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/Title.dart';
import 'package:finalproject/Component/buid_container.dart';

import 'package:finalproject/pages/Height_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';
import '../Component/Colors.dart';

class WeightPicker extends StatelessWidget {
  final String userid;

  WeightPicker({required this.userid});
  late int Weight;

  late List<String> Paragraph = [
    "Weight in kilogram , Don't worry you can always ",
    "change it later"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(int.parse(Black)),
          ),
          body: buildContainer(
            backgroundColor: Color(int.parse(Black)),
            child: Column(
              children: [
                titles(
                  txt: "What is your Weight ?",
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
                        value: BlocProvider.of<UserCubit>(context).weight,
                        minValue: 0,
                        maxValue: 200,
                        axis: Axis.horizontal,
                        infiniteLoop: false,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Color(int.parse(Purple)), width: 2),
                            top: BorderSide(
                                color: Color(int.parse(Purple)), width: 2),
                          ),
                        ),
                        selectedTextStyle: TextStyle(
                          fontSize: 35,
                          color: Color(int.parse(Purple)),
                        ),
                        textStyle: TextStyle(
                          fontSize: 30,
                          color: Color(int.parse(White)),
                        ),
                        onChanged: (value) => 
                          BlocProvider.of<UserCubit>(context).updateWeight(value,userid)
                        
                      ),
                    ],
                  ),
                ),
                Sized_Gap(Height: 5),
                titles(
                    txt: "Your Weight is ${BlocProvider.of<UserCubit>(context).weight} kg",
                    Font_size: 30),
                Sized_Gap(Height: 5),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buttons(
                          text: "Back",
                          colour: Color(int.parse(Grayish)),
                          action: () {
                            Navigator.pop(context);
                          },
                          Pad_Left_Right: 45,
                          Font_size: 20),
                      buttons(
                        text: "Continue",
                        action: () {
                          // Use the weight from the UserCubit
                          BlocProvider.of<UserCubit>(context).updateWeight(
                              BlocProvider.of<UserCubit>(context).weight, userid);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HeightPicker(userid: userid),
                            ),
                          );
                          print(BlocProvider.of<UserCubit>(context).weight);
                        },
                        Pad_Left_Right: 20,
                        Font_size: 20,
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
