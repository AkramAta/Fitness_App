import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Component/Colors.dart';
import '../Component/SizedBox_for Gapping.dart';
import '../Component/Title.dart';

import '../Component/Paragraphs.dart';
import '../Component/buid_container.dart';

class Notification_Page extends StatelessWidget {
  final List<Map<String, dynamic>> sections = [
    {
      "title": "Today",
      "notifications": [
        {
          "icon": FontAwesomeIcons.circleCheck,
          "title": "Congratulations!",
          "subtitle": "You've been exercising for 2 hours",
          "borderColor": Colors.green,
        },
        {
          "icon": FontAwesomeIcons.plus,
          "title": "New Workout is Available!",
          "subtitle": "Check now and practice",
          "borderColor": Color(0xff4379F2),
        }
      ]
    },
    {
      "title": "Yesterday",
      "notifications": [
        {
          "icon": FontAwesomeIcons.solidClock,
          "title": "New Features are Available",
          "subtitle": "You can now set exercise reminder",
          "borderColor": Color(0xffFC5B5B),
        },
      ]
    },
    {
      "title": "December 11, 2024",
      "notifications": [
        {
          "icon": FontAwesomeIcons.circleCheck,
          "title": "Verification Successful",
          "subtitle": "Account verification complete",
          "borderColor": Colors.green,
        },
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
        title: titles(
          txt: 'Notification',
          text_Align: TextAlign.start,
          Font_size: 20,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(int.parse(White)),
          ),
          onPressed: () {
           Navigator.pop(context);
          },
        ),
      ),
      body: buildContainer(
        padding_All_direction: 30,
        backgroundColor: Color(int.parse(Black)),
        child: ListView.builder(
          itemCount: sections.length,
          itemBuilder: (context, sectionIndex) {
            var section = sections[sectionIndex];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titles(
                  txt: section['title'],
                  Font_size: 30,
                ),
                Sized_Gap(Height: 20),
                for (var notification in section['notifications'])
                  ListTile(
                    leading: Container(
                      margin: EdgeInsets.only(top: 0, bottom: 0),
                      decoration: BoxDecoration(
                        color:notification['borderColor'] ,
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          width: 1,
                          color: notification['borderColor'],
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        notification['icon'],
                        color:Color(int.parse(White)),
                        size: 30,
                      ),
                    ),
                    title: titles(
                      txt: notification['title'],
                      Font_size: 20,
                    ),
                    subtitle: paragraph(
                      text: notification['subtitle'],
                      Font_size: 15,
                      TextAlign: TextAlign.center,
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}