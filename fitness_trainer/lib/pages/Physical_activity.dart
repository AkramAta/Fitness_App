import 'package:finalproject/Business_Logic/Cubit/User_Cubit.dart';
import 'package:finalproject/Business_Logic/Cubit/User_State.dart';
import 'package:finalproject/Component/Button.dart';
import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/buid_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Component/Colors.dart';
import '../Component/Paragraphs.dart';
import '../Component/Title.dart';

class PhysicalActivity extends StatelessWidget {
  
  late List<String> paragraphs = [
    "Choose your regular activty level this will",
    "help us to personalize plans for you "
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
            child: Column(children: [
              Animate(
                effects: [
                  FadeEffect(
                    duration: Duration(seconds: 5),
                  )
                ],
                child: titles(txt: "Physical Activity Level ?", Font_size: 30),
              ),
              Sized_Gap(Height: 15),
              for (int i = 0; i < paragraphs.length; i++)
                Animate(
                  effects: [
                    FadeEffect(
                        duration: Duration(seconds: 5),
                        delay: Duration(milliseconds: 500))
                  ],
                  child: paragraph(
                      Font_size: 17,
                      text: paragraphs[i],
                      color: Color(int.parse(White))),
                ),
              Sized_Gap(Height: 130),
              Animate(
                effects: [
                  FadeEffect(
                      duration: Duration(seconds: 5),
                      delay: Duration(milliseconds: 250))
                ],
                child: Column(
                  children: [
                    buttons(
                        colour: BlocProvider.of<UserCubit>(context).activityLevel == "Beginner"
                            ? Color(int.parse(Purple))
                            : Color(int.parse(Grayish)),
                        text: "Beginner",
                        Pad_Left_Right: 120,
                        action: () {
                          
                            BlocProvider.of<UserCubit>(context).updateActivityLevel("Beginner");
                            // print(BlocProvider.of<UserCubit>(context).activityLevel);
                           
                          
                        }),
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
                child: buttons(
                    colour:BlocProvider.of<UserCubit>(context).activityLevel == "Intermediate"
                        ? Color(int.parse(Purple))
                        : Color(int.parse(Grayish)),
                    text: "Intermediate",
                    Pad_Left_Right: 100,
                    action: () {
                      BlocProvider.of<UserCubit>(context).updateActivityLevel("Intermediate");
                      // print(BlocProvider.of<UserCubit>(context).activityLevel);
                      
                    }),
              ),
              Sized_Gap(Height: 30),
              Animate(
                effects: [
                  FadeEffect(
                      duration: Duration(seconds: 5),
                      delay: Duration(milliseconds: 500))
                ],
                child: buttons(
                    colour: BlocProvider.of<UserCubit>(context).activityLevel == "Advanced"
                        ? Color(int.parse(Purple))
                        : Color(int.parse(Grayish)),
                    text: "Advanced",
                    Pad_Left_Right: 115,
                    action: () {
                     BlocProvider.of<UserCubit>(context).updateActivityLevel("Advanced");
                    //  print(BlocProvider.of<UserCubit>(context).activityLevel);
                     
                    }),
              ),
              Sized_Gap(Height: 120),
              Container(
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
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => Home));
                        },
                        Pad_Left_Right: 30,
                        Font_size: 20),
                  ],
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}


