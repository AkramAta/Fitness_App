import 'package:finalproject/Component/Button.dart';
import 'package:finalproject/Component/buid_container.dart';
import 'package:finalproject/pages/ChangePasswordSecurity.dart';


import 'package:flutter/material.dart';
import '../Component/Colors.dart';
import '../Component/Title.dart';

class Security_Settings extends StatefulWidget {
  @override
  final String userid;
  final Map<String, dynamic> data;

  Security_Settings({
    required this.userid,
    required this.data,
  });

  State<Security_Settings> createState() => _Security_Settings();
}

class _Security_Settings extends State<Security_Settings> {
  late List<String> Titles = [
    "Face id",
    "Remember me"
        "Touch id",
    "App Updates",
  ];
  late List<bool> Values = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
        title: titles(
          txt: 'Security Settings',
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
              flex: 5,
              child: ListView.builder(
                itemCount: Titles.length,
                itemBuilder: (context, i) {
                  return SwitchListTile(
                    title: titles(
                        txt: Titles[i],
                        Font_size: 20,
                        text_Align: TextAlign.start),
                    value: Values[i],
                    onChanged: (bool NewValue) {
                      setState(() {
                        Values[i] = NewValue;
                      });
                    },
                  );
                },
              ),
            ),
            Expanded(
              flex: 15,
              child: ListTile(
                title: titles(
                    txt: "Google Authenticator",
                    Font_size: 20,
                    text_Align: TextAlign.start),
                trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_right,
                      color: Color(int.parse(Purple)),
                    )),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: buttons(
                    text: "Change Password",
                    Pad_Left_Right: 60,
                    colour: Color(int.parse(Grayish)),
                    action: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePasswordSecurity(
                                    userid: widget.userid,
                                    data: widget.data,
                                  )));
                    }))
          ],
        ),
      ),
    );
  }
}
