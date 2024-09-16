import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:finalproject/Component/Button.dart';
import 'package:finalproject/Component/Paragraphs.dart';
import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/awesome_dialog.dart';
import 'package:finalproject/Component/buid_container.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '../Component/Colors.dart';
import '../Component/Title.dart';
import 'creat new password.dart';

class Otp extends StatefulWidget {
  final String otp, email;
  final dynamic userdic;

  Otp({required this.otp, required this.email, required this.userdic});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  late String oldpassword;

  int Countor = 60;
  late Timer _timer;
  late String userotp = "";
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();
  final TextEditingController num3 = TextEditingController();
  final TextEditingController num4 = TextEditingController();

  @override
  void initState() {
    super.initState();
    Strattimer();
  }

  void Strattimer() {
    Countor = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (Countor > 0) {
        setState(() {
          Countor--;
        });
      } else {
        _timer.cancel();
      }
    });
  }

  Future<void> getUserData(String userId) async {
    DocumentSnapshot document =
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userdic)
        .get();

    if (document.exists) {
      // Convert document data to a map
      Map<String, dynamic>? userData = document.data() as Map<String, dynamic>?;

      if (userData != null) {
        String email = userData['email'] ?? 'No email available';
        oldpassword = userData['password'] ?? 'No password available';

        print('Email: $email');
        print('Password: $oldpassword');
      }
    } else {
      snacka(context, "User does not exist");
    }
  }

  Future<void> checkOTP(String userOtp) async {
    try {
      bool verified = await EmailOTP.verifyOTP(otp: userOtp);
      if (verified) {
        showDialogWithContext(context, "OTP Verified Successfully");

        await getUserData(widget.email);

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChangePassword(
            email: widget.email,
            oldPassword: oldpassword,
            userdic: widget.userdic,
          ),
        ));
      } else if (EmailOTP.isOtpExpired()) {
        snacka(context, "Your OTP has expired");
      } else {
        snacka(context, "Invalid OTP! Please try again");
      }
    } catch (e) {
      print("Error verifying OTP: $e");
    }
  }

  Future<void> resendOTP() async {
    await EmailOTP.sendOTP(
        email: widget.email); // Removed the unused resend variable
    showDialogWithContext(context, "OTP Resend Successfully");
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
        title: titles(
          txt: 'Forgot Password',
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
        padding_All_direction: 50,
        backgroundColor: Color(int.parse(Black)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            paragraph(
              text: "Code sent to ${widget.email}",
              color: Color(int.parse(White)),
              Font_size: 20,
            ),
            Sized_Gap(Height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildOtpTextField(num1),
                _buildOtpTextField(num2),
                _buildOtpTextField(num3),
                _buildOtpTextField(num4),
              ],
            ),
            Sized_Gap(Height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (Countor > 0)
                  paragraph(
                    text: "Resend code in ",
                    color: Color(int.parse(White)),
                    Font_size: 20,
                  ),
                if (Countor > 0)
                  paragraph(
                    text: "$Countor",
                    color: Color(int.parse(Purple)),
                    Font_size: 20,
                  )
                else
                  GestureDetector(
                    onTap: () async {
                      await resendOTP();
                      Strattimer();
                      num1.clear();
                      num2.clear();
                      num3.clear();
                      num4.clear();
                    },
                    child: Text(
                      'Resend Code',
                      style: TextStyle(color: Color(int.parse(Purple))),
                    ),
                  ),
              ],
            ),
            Spacer(),
            buttons(
              text: "Verify",
              action: () async {
                userotp = num1.text + num2.text + num3.text + num4.text;
                await checkOTP(userotp);
                userotp = "";
              },
              Pad_Left_Right: 141,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpTextField(TextEditingController c) {
    return SizedBox(
      width: 64,
      height: 64,
      child: TextFormField(
        controller: c,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Color(int.parse(White)),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: InputDecoration(
          hintText: "X",
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(int.parse(White)),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(int.parse(Purple)),
            ),
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
