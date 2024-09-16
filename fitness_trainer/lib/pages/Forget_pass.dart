import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:finalproject/Component/Button.dart';
import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/Title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Component/Colors.dart';
import '../Component/awesome_dialog.dart';
import 'otp code.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreen();
}

class _ForgotPasswordScreen extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  String? docid;

  Future<String?> getDocumentIdByEmail(String email) async {
    final firestore = FirebaseFirestore.instance;

    try {
      final querySnapshot = await firestore.collection('users').get();
      final documents = querySnapshot.docs;

      if (documents.isNotEmpty) {
        for (int i = 0; i < documents.length; i++) {
          var doc = documents[i];
          var fieldValue = doc.data()['email'];

          if (fieldValue == email) {
            print('Document ID at index $i: ${doc.id}');
            send(email);
            return doc.id;
          }
        }
        print('No document found with the provided email');
        return null;
      } else {
        print('No documents found in the collection');
        return null;
      }
    } catch (e) {
      print('Error fetching documents: $e');
      return null;
    }
  }

  void send(String email) {
    EmailOTP.config(
      appName: 'Fitness App',
      otpType: OTPType.numeric,
      expiry: 60000,
      emailTheme: EmailTheme.v4,
      appEmail: 'FitnessApp@gmail.com',
      otpLength: 4,
    );

    EmailOTP.sendOTP(email: email).then((value) {
      if (value) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Otp(
              otp: EmailOTP.getOTP() ?? '',
              email: email,
              userdic: docid,
            ),
          ),
        );
        showDialogWithContext(context, "✅️ OTP Sent to Email 📧 Successfully");
      } else {
        snacka(context, 'Failed to send OTP');
      }
    }).catchError((e) {
      snacka(context, 'Failed to send OTP');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(int.parse(Black)),
        title: titles(
            txt: 'Forgot Password', text_Align: TextAlign.start, Font_size: 20),
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
          child: SingleChildScrollView(
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
                Sized_Gap(Height: 25),
                titles(
                    txt: "Enter Your Email",
                    Font_size: 20,
                    txt_color: Color(int.parse(White))),
                TextFormField(
                  keyboardAppearance: Brightness.dark,
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
                  action: () async {
                    docid =
                        await getDocumentIdByEmail(emailController.text) ?? '';
                    emailController.clear();
                  },
                  Pad_Top_Bottom: 10,
                  Pad_Left_Right: 155,
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
