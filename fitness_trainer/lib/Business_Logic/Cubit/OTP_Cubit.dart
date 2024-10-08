



import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:finalproject/Component/Snack_Bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Otp_State.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  int counter = 60;
  late Timer _timer = Timer(Duration(seconds: 0), () {});
  late bool obscureText2 = true;

  // Start countdown timer
  void startTimer() {
    counter = 60;
    emit(OtpCounting(counter));
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (counter > 0) {
        counter--;
        emit(OtpCounting(counter));
      } else {
        _timer.cancel();
        emit(OtpExpired()); // Change state to expired when the timer reaches 0
      }
    });
  }

  // Mock Verifying OTP for Testing
  Future<void> verifyOtp(String userOtp) async {
    print("Verifying OTP: $userOtp");
    try {
      // Using "1234" as a mock OTP for testing
      bool verified = await EmailOTP.verifyOTP(otp: userOtp );
      if (verified) {
        print("OTP Verified");
        emit(OtpVerified()); // OTP is verified
      } else {
        print("OTP Invalid");
        emit(OtpInvalid()); // OTP is invalid
      }
    } catch (e) {
      emit(OtpError(e.toString()));
    }
  }

  // Mock Resending OTP for Testing
  Future<void> resendOtp(String email) async {
    print("Resending OTP to $email");
    startTimer(); // Start the timer again after resending the OTP
    emit(OtpResent());
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }





  // Function to reauthenticate and change the password
  Future<void> reauthenticateAndChangePassword({
    required String email,
    required String oldPassword,
    required String newPassword,
    required dynamic userdic,
    required BuildContext context,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        // Re-authenticate with the user's email and the old password
        AuthCredential credential = EmailAuthProvider.credential(
          email: email,
          password: oldPassword,
        );

        await user.reauthenticateWithCredential(credential);
        print("User re-authenticated");

        // Now update the password
        await user.updatePassword(newPassword);
        print("Password updated successfully");

        // Now update the password in Firestore as well
        DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(userdic);
        await userDoc.update({
          'password': newPassword,
        });

        snacka(context, 'Password updated successfully in Firestore.');
      } catch (e) {
        snacka(context, "Failed to update Your password");
      }
    } else {
      snacka(context, "No user is signed in");
    }
  }




  void toggleVisibility2() {
    
       obscureText2 = !obscureText2;
      emit(OtpPasswordChange());
  }
}