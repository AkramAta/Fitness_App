import 'package:finalproject/Component/Button.dart';
import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/Title.dart';
import 'package:flutter/material.dart';
import '../Component/Colors.dart';

class Otp extends StatefulWidget {
  @override
  State<Otp> createState() => _Otp();
}
class _Otp extends State<Otp> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
        title: titles(
            txt: 'Forgot Password',
            text_Align: TextAlign.start,
            Font_size: 20),
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
      body: Container(
        height: 900,
        color: Color(int.parse(Black)),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView( // Wrapped the Column inside SingleChildScrollView
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'Assets/Image/reset_password.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Sized_Gap(Height: 20),
                titles(
                  txt:
                  'Select which contact details should we use to reset your password',
                  txt_color: Color(int.parse(White)),
                  Font_size: 20,
                  text_Align: TextAlign.left,
                ),
                Sized_Gap(Height: 20),
                titles(
                    txt: "Enter Your Email",
                    Font_size: 20,
                    txt_color: Color(int.parse(White))),
                TextFormField(
                  style: TextStyle(
                    color: Color(int.parse(White)),
                  ),
                  controller: emailController,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.mail),
                    suffixIconColor: Color(int.parse(White)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(int.parse(Purple)))),
                    hintText: 'example@example.com',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                Sized_Gap(Height: 150),
                buttons(
                  action: () {
                    emailController.clear();
                  },
                  Pad_Top_Bottom: 2.5,
                  Pad_Left_Right: 125,
                  text: "Continue",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}