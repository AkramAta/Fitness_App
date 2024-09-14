import 'package:finalproject/Component/Button.dart';
import 'package:finalproject/Component/Colors.dart';
import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/Title.dart';
import 'package:finalproject/Component/buid_container.dart';
import 'package:flutter/material.dart';

class ExerciseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse(Black)),
      body: SafeArea(
        child: buildContainer(
          backgroundColor: Color(int.parse(Black)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
         Expanded(
           flex: 9,
           child: Container(
             decoration:BoxDecoration(
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(20),
                   topRight: Radius.circular(20),
                 ),
              image: DecorationImage(
                fit: BoxFit.fill,
                  image: AssetImage("Assets/Image/bg-card-1.jpg" )
              )
             ),
           ),
         )
            // Pose name and pause button
            ,Expanded(
                flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    titles(txt:'Text-here', Font_size:30 ),
                    Sized_Gap(Height:20 ),
                  ],
                ),
              ),
            ),
            // Navigation buttons
            Padding(
              padding: const EdgeInsets.only(
                 left: 20.0 , top: 5  , bottom: 50  , right:20.0
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 buttons(text:  'Previous', action: (){} , Font_size: 20 , colour: Color(int.parse(Grayish))),
                  buttons(text:  'Skip', action: (){} , Font_size: 20 , colour: Color(int.parse(Grayish))),
                ],
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}