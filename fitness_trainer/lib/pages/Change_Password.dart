import 'package:finalproject/Component/Button.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/buid_container.dart';
import '../Component/Colors.dart';
import '../Component/Text_Form.dart';
import '../Component/Title.dart';

class ChangePassword extends StatefulWidget {
  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}
class _ChangePasswordState extends State<ChangePassword> {
  late TextEditingController currentPassword = TextEditingController();
  late TextEditingController newPassword = TextEditingController();
  late bool securedText = true;
  late bool securedText2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
        title: titles(
          txt: 'Create New Password',
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
        padding_All_direction: 20,
        backgroundColor: Color(int.parse(Black)),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage("Assets/Image/Create-password.png")),
                Sized_Gap(Height: 20),
                buildTextFormField(
                  obSecured_text: securedText,
                  controller: currentPassword,
                  focusedBorderColor: Color(int.parse(Purple)),
                  borderColor: Color(int.parse(White)),
                  contentPadding: EdgeInsets.all(25),
                  fillColor: Colors.transparent,
                  labelText: "Enter your current password",
                  labelColor: Color(int.parse(White)),
                  hintText: "***********",
                  textColor: Color(int.parse(White)),
                  iconColor: Color(int.parse(White)),
                  suffixIcon: IconButton(
                    icon: Icon(securedText ? Icons.visibility : Icons.visibility_off,),
                    onPressed: () {
                      setState(() {securedText = !securedText;});
                    },
                  ),
                  Changed: (v) {
                    return v;
                  },
                  Tapped: () {
                  },
                ),
                Sized_Gap(Height: 20),
                buildTextFormField(
                  obSecured_text: securedText2,
                  controller: newPassword,
                  focusedBorderColor: Color(int.parse(Purple)),
                  borderColor: Color(int.parse(White)),
                  contentPadding: EdgeInsets.all(25),
                  fillColor: Colors.transparent,
                  labelText: "Enter your New password",
                  labelColor: Color(int.parse(White)),
                  hintText: "***********",
                  textColor: Color(int.parse(White)),
                  iconColor: Color(int.parse(White)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      securedText2 ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(()
                      {securedText2 = !securedText2;
                      });
                    },
                  ),
                  Changed: (v) {
                    return v;
                  },
                  Tapped: () {},
                ),
              ],
            ),
            Sized_Gap(
                Height:
                100
            ),
            buttons(text:
            "Countiune",
                action: (){})
          ],
        ),
      ),
    );
  }
}