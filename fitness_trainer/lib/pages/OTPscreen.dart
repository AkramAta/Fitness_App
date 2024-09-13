// // 




// import 'package:finalproject/Business_Logic/Cubit/OTP_Cubit.dart';
// import 'package:finalproject/Business_Logic/Cubit/Otp_State.dart';
// import 'package:finalproject/Component/Button.dart';
// import 'package:finalproject/Component/Colors.dart';
// import 'package:finalproject/Component/Paragraphs.dart';
// import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
// import 'package:finalproject/Component/Title.dart';
// import 'package:finalproject/Component/buid_container.dart';
// import 'package:finalproject/Constant/Widgets/BuildOTPTextField.dart';
// import 'package:finalproject/pages/Change_Password.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Otp extends StatelessWidget {
//   final String otp;
//   final String email;
//   final TextEditingController num1 = TextEditingController();
//   final TextEditingController num2 = TextEditingController();
//   final TextEditingController num3 = TextEditingController();
//   final TextEditingController num4 = TextEditingController();

//   Otp({required this.otp, required this.email,required this.userdic});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => OtpCubit()..startTimer(),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(int.parse(Black)),
//           title: titles(
//             txt: 'Forgot Password',
//             text_Align: TextAlign.start,
//             Font_size: 20,
//           ),
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               color: Color(int.parse(White)),
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: BlocListener<OtpCubit, OtpState>(
//           listener: (context, state) {
//             if (state is OtpVerified) {
//               print("OTP Verified - Navigating to ChangePassword screen");
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => ChangePassword()),
//               );
//             } else if (state is OtpInvalid) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Invalid OTP! Please try again.')),
//               );
//             } else if (state is OtpError) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text(state.message)),
//               );
//             }
//           },
//           child: BlocBuilder<OtpCubit, OtpState>(
//             builder: (context, state) {
//               final otpCubit = context.read<OtpCubit>();

//               return buildContainer(
//                 padding_All_direction: 50,
//                 backgroundColor: Color(int.parse(Black)),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     paragraph(
//                       text: "Code sent to $email",
//                       color: Color(int.parse(White)),
//                       Font_size: 20,
//                     ),
//                     Sized_Gap(Height: 30),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         buildOtpTextField(num1, context),
//                         buildOtpTextField(num2, context),
//                         buildOtpTextField(num3, context),
//                         buildOtpTextField(num4, context),
//                       ],
//                     ),
//                     Sized_Gap(Height: 30),
//                     if (state is OtpCounting)
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           paragraph(
//                             text: "Resend code in ",
//                             color: Color(int.parse(White)),
//                             Font_size: 20,
//                           ),
//                           paragraph(
//                             text: "${state.counter}",
//                             color: Color(int.parse(Purple)),
//                             Font_size: 20,
//                           ),
//                         ],
//                       ),
//                     if (state is OtpExpired)
//                       GestureDetector(
//                         onTap: () async {
//                           otpCubit.resendOtp(email);
//                           num1.clear();
//                           num2.clear();
//                           num3.clear();
//                           num4.clear();
//                         },
//                         child: Text(
//                           'Resend Code',
//                           style: TextStyle(color: Color(int.parse(Purple))),
//                         ),
//                       ),
//                     Spacer(),
//                     buttons(
//                       text: "Verify",
//                       Font_size: 20,
//                       action: () {
//                         final userOtp =
//                             num1.text + num2.text + num3.text + num4.text;
//                         print("User OTP: $userOtp"); // Debugging statement
//                         otpCubit.verifyOtp(userOtp); // Trigger OTP verification
//                       },
//                       Pad_Left_Right: 100,
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:finalproject/Component/Alert_Dialog.dart';
import 'package:finalproject/Component/Button.dart';
import 'package:finalproject/Component/Colors.dart';
import 'package:finalproject/Component/Paragraphs.dart';
import 'package:finalproject/Component/SizedBox_for%20Gapping.dart';
import 'package:finalproject/Component/Snack_Bar.dart';
import 'package:finalproject/Component/Title.dart';
import 'package:finalproject/Component/buid_container.dart';
import 'package:finalproject/Constant/Widgets/BuildOTPTextField.dart';
import 'package:finalproject/pages/Change_Password.dart';
import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  final String otp, email;
  final dynamic userdic;
  
  Otp({required this.otp, required this.email, required this.userdic});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  // Initialize 'oldpassword' with a default value
  String oldpassword = ''; 

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
    DocumentSnapshot document = await FirebaseFirestore.instance
        .collection('users').doc(widget.userdic).get();

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
      snacka(context,"User does not exist");
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
            oldPassword: oldpassword, // Now it's guaranteed to be initialized
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
    await EmailOTP.sendOTP(email: widget.email); // Removed the unused resend variable
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
                buildOtpTextField(num1, context),
                buildOtpTextField(num2, context),
                buildOtpTextField(num3, context),
                buildOtpTextField(num4, context),
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
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ChangePassword(
                    oldPassword: oldpassword,
                    email: widget.email,
                    userdic: widget.userdic,
                  ),
                ));
              },
              Pad_Left_Right: 100,
            ),
          ],
        ),
      ),
    );
  }
}
