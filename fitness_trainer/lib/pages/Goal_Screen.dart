import 'package:finalproject/Business_Logic/Cubit/User_Cubit.dart';
import 'package:finalproject/Business_Logic/Cubit/User_State.dart';
import 'package:finalproject/Component/Colors.dart';
import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/buid_container.dart';
import 'package:finalproject/pages/Physical_activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Component/Build_ContainerWith_Border.dart';
import '../Component/Button.dart';
import '../Component/Paragraphs.dart';
import '../Component/Title.dart';

class GoalScreen extends StatefulWidget {
  final String userid;

  GoalScreen({required this.userid});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  late List<String> paragraphs;
  late List<String> goalsTargets;
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
    BlocProvider.of<UserCubit>(context).initializeGoals(goalsTargets.length);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
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
                  paragraph(text: paragraphs[i], Font_size: 17),
                Sized_Gap(Height: 20),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    itemCount: goalsTargets.length,
                    itemBuilder: (context, index) {
                      // Determine border color based on the checkbox state
                      String BorderColor = BlocProvider.of<UserCubit>(context)
                              .isCheckedList[index]
                          ? Purple
                          : White;
                      return buildContainerWithBorder(
                        Margin_top_and_bottom: 15,
                        borderWidth: 1,
                        borderRadius: 10,
                        borderColor: Color(int.parse(BorderColor)),
                        child: CheckboxListTile(
                          title: titles(
                              txt: goalsTargets[index],
                              Font_size: 25,
                              text_Align: TextAlign.left),
                          value: BlocProvider.of<UserCubit>(context).isCheckedList[index],
                          onChanged: (bool? value) {
                            BlocProvider.of<UserCubit>(context).updateCheckbox(index, value!);
                            print(BlocProvider.of<UserCubit>(context).isCheckedList);
                            BlocProvider.of<UserCubit>(context).updateGoalTargetusercubit(
                                goalsTargets[index], widget.userid);

                            BlocProvider.of<UserCubit>(context).isCheckedList[index] = value;
                          },
                        ),
                      );
                    },
                  ),
                ),
                Sized_Gap(Height: 20),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buttons(
                          text: "Back",
                          colour: Color(int.parse(Grayish)),
                          action: () {
                            Navigator.pop(context);
                          },
                          Pad_Left_Right: 50,
                          Font_size: 20),
                      buttons(
                          text: "Continue",
                          action: () {
                            BlocProvider.of<UserCubit>(context)
                                .updateGoalTarget( BlocProvider.of<UserCubit>(context).goal, widget.userid);

                             Navigator.push(
                             context,
                               MaterialPageRoute(
                                   builder: (context) => PhysicalActivity(userid: widget.userid,),
                                ),
                             );
                          },
                          Pad_Left_Right: 35,
                          Font_size: 20),
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
