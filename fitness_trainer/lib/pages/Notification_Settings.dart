import 'package:finalproject/Component/buid_container.dart';
import 'package:flutter/material.dart';

import '../Component/Colors.dart';
import '../Component/Title.dart';
class NotificationSettings extends StatefulWidget {
  @override
  State<NotificationSettings> createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  late List <String> Titles= [
  "General Notification" , "Sound"
  "Vibrate", "App Updates" ,
  "New Service Available" ,
  "New tips Available"
  ];
  late List <bool> Values = [
    false,    false,    false,    false,    false,    false,
  ];
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(int.parse(Black)),
      title: titles(
        txt: 'Notifications Settings',
        text_Align: TextAlign.start,
        Font_size: 20,
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Color(int.parse(White)),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ),
    body: buildContainer(
        backgroundColor: Color(int.parse(Black)),
      child: Column(
        children: [
        Expanded(
          child: ListView.builder(
            itemCount: Titles.length,
            itemBuilder: (context , i){
              return SwitchListTile(
                title: titles(txt: Titles[i], Font_size: 20 , text_Align: TextAlign.start),
                value:Values[i] ,
                onChanged: (bool NewValue){
                  setState(() {
                    Values[i] = NewValue;
                  });
                },
              );
            },
          ),
        )
        ],
      ),
    ),
  );
  }
}