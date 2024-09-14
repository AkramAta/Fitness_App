import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Component/awesome_dialog.dart'; // Firebase Auth import

class NewPassword extends StatefulWidget {
  final String email;
  final String Oldpassword;
  final dynamic userdic;

  NewPassword(
      {required this.email, required this.Oldpassword, required this.userdic});

  @override
  _NewPasswordState createState() =>
      _NewPasswordState(); // Correct createState method
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController passwordController = TextEditingController();

  // Reference to Firestore collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> reauthenticateAndChangePassword(String newPassword) async {
    User? user = FirebaseAuth.instance.currentUser;
    print(widget.Oldpassword);
    print(widget.email);
    if (user != null) {
      try {
        // Re-authenticate with the user's email and the old password
        AuthCredential credential = EmailAuthProvider.credential(
          email: widget.email,
          password: widget.Oldpassword,
        );

        await user.reauthenticateWithCredential(credential);
        print("User re-authenticated");

        // Now update the password
        await user.updatePassword(newPassword);
        print("Password updated successfully");

        // Now update the password in Firestore as well
        DocumentReference userDoc =
            FirebaseFirestore.instance.collection('users').doc(widget.userdic);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 200),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey),
            ),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Enter new password',
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              obscureText: true,
            ),
          ),
          SizedBox(height: 200),
          MaterialButton(
            onPressed: () async {
              await reauthenticateAndChangePassword(passwordController.text);
            },
            child: Text(
              "Reset Password",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
