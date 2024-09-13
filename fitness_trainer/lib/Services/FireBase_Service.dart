import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/Component/Alert_Dialog.dart';
import 'package:finalproject/Component/Snack_Bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Add or update user data
Future<void> addUser({ String? userId, String? name,String? nickName,String? image, int? age, int? weight, int? height, String? gender, String? email, String? password,String? phone, List <String>? selectedGoals, String? activitylevel}) async {
  await FirebaseFirestore.instance.collection('users').doc(userId).set({
    'name': name,
    'nickName': nickName,
    'image' : image,
    'age': age,
    'weight': weight,
    'height': height,
    'gender': gender,
    'email': email,
    'password': password,
    'phone': phone,
    'selectedGoals': selectedGoals,
    'activitylevel': activitylevel
  });
}



// Read user data
Future<void> getUserData(String userId) async {
  DocumentSnapshot document = await FirebaseFirestore.instance.collection('users').doc(userId).get();
  if (document.exists) {
    print(document.data()); // Use this data in your app
  } else {
    print("User does not exist");
  }
}


// Update specific fields in a document
Future<void> updateUserData(String userId, Map<String, dynamic> newData) async {
  await FirebaseFirestore.instance.collection('users').doc(userId).update(newData);
}



// Delete a document
Future<void> deleteUser(String userId) async {
  await FirebaseFirestore.instance.collection('users').doc(userId).delete();
}




// Sign up new user
Future<User?> signUp(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  } catch (e) {
    print(e);
    return null;
  }
}

// Login existing user
Future<User?> login(String email, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  } catch (e) {
    print(e);
    return null;
  }
}




Future<String?> getUserToken() async {
  try {
    User? user = FirebaseAuth.instance.currentUser;

    // Check if the user is logged in
    if (user != null) {
      // Get the useString? token
      String? idToken = await user.getIdToken();
      return idToken;
    } else {
      print('User not logged in');
      return null;
    }
  } catch (e) {
    print('Error retrieving token: $e');
    return null;
  }
}



Future<void> loginUser(String email, String password,BuildContext context,List listtoken,String spe) async {
  bool check_email(String email) {
    String name = "";
    for (int i = 0; i < email.length; i++) {
      if (email[i] == "@") {
        name += email.substring(i);
        spe = "@";
        break;
      }
    }
    return name == "@gmail.com";
  }

  Future<bool> checkEmailVerified() async {
    User? user = FirebaseAuth.instance.currentUser;

    await user?.reload();

    if (user?.emailVerified == true) {
      user = FirebaseAuth.instance.currentUser;
      return true;
    } else
      return false;

  }




  try {
    if (await checkEmailVerified()) {
      // Sign in with email and password
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      showDialogWithContext(context,"you have successfully logged in");

      String? token = await userCredential.user!.getIdToken();
      print("User token: $token");
      listtoken.add(token!);
      print(listtoken);

    } else {
      print("Email not verified");

      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await currentUser.sendEmailVerification().then((_) {
          snacka(context, 'Successfully sent email verification');
        }).catchError((onError) {
          snacka(context, 'Error sending email verification: $onError');

        });
      } else {
        snacka(context, "No user is currently signed in");

      }
    }
  }
  on FirebaseAuthException catch (e) {
    print(e);

    if (e.code == 'user-not-found') {
      snacka(context,'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      snacka(context,'Wrong password provided.');
    } else if (e.code == 'invalid-email') {
      snacka(context,'Invalid email format.');
      if (!check_email(email)) {
        snacka(context, "Your email is missing @gmail.com");
      }
    } else if (e.code == 'missing-password') {
      snacka(context, 'Password is missing.');
      print('Password is missing.');
    } else if (e.code == 'invalid-credential') {
      snacka(context, "The password or email is wrong.");
    } else if (e.code == 'channel-error') {
      if (email.isEmpty && password.isEmpty) {
        snacka(context,"Please enter your email and password.");
        print(listtoken);
      } else if (email.isNotEmpty && password.isEmpty) {
        snacka(context,"Please enter your password.");
      } else {
        snacka(context,"Please enter your email.");
      }
    } else if (e.code == "network-request-failed") {
      snacka(context,"network-request-failed");
      print("You lost your connection.");
    } else if (e.code == "unknown") {
      snacka(context,"This doesn't exist.");
    }
  } catch (e) {
    snacka(context,"Unexpected error: $e");
  }
}





Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}





Future<void> RegisterWith(String email, String password, BuildContext context) async {
  String spe = "";

  bool check_email(String email) {
    String name = "";
    for (int i = 0; i < email.length; i++) {
      if (email[i] == "@") {
        name += email.substring(i);
        spe = "@";
        break;
      }
    }
    return name == "@gmail.com";
  }

  bool check_password(String password) {
    if (password.length >= 8) {
      for (int i = 0; i < password.length; i++) {
        int codeUnit = password[i].codeUnitAt(0);
        if ((codeUnit >= 32 && codeUnit <= 38) || password[i] == "@") {
          return true;
        }
      }
    }
    return false;
  }

  try {
    print("Checking email and password...");

    final emailValid = check_email(email);
    final passwordValid = check_password(password);

    if (emailValid && passwordValid && email.isNotEmpty && password.isNotEmpty) {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      showDialogWithContext(context,'your account registered successfully');

      await credential.user?.sendEmailVerification().then((_) {
        Future.delayed(Duration(milliseconds: 670), () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          snacka(context, 'Successfully sent email verification');
        });
      }).catchError((onError) {

        snacka(context,'Error sending email verification: $onError');

      });

    } else {
       if (email.isEmpty) {
        snacka(context,"Email cannot be empty");

       }
      else if (password.isEmpty) {
        snacka(context,"Password cannot be empty");


      }
     else if (!emailValid) {
        snacka(context,"Your email must be in the format example@gmail.com");


      }
      else if (!passwordValid) {
        snacka(context,"Weak password. Enter a password with at least one special character.");


      }
    }
  } on FirebaseAuthException catch (e) {

    if (e.code == 'weak-password') {
      snacka(context,"The password provided is too weak.");
      print("The password provided is too weak.");
    } else if (e.code == 'email-already-in-use') {
      snacka(context,"The email address is already in use by another account.");
    } else {
      snacka(context,"Error: ${e.message}");
    }
  } catch (e) {
    snacka(context,'Unexpected error: $e');
  }
}




// Future<void> reauthenticateAndChangePassword(String newPassword, BuildContext context, ) async {
//     User? user = FirebaseAuth.instance.currentUser;
// print(widget.Oldpassword);
// print(widget.email);
//     if (user != null) {
//       try {
//         // Re-authenticate with the user's email and the old password
//         AuthCredential credential = EmailAuthProvider.credential(
//           email: widget.email,
//           password: widget.Oldpassword,
//         );

//         await user.reauthenticateWithCredential(credential);
//         print("User re-authenticated");

//         // Now update the password
//         await user.updatePassword(newPassword);
//         print("Password updated successfully");

//         // Now update the password in Firestore as well
//         DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(widget.userdic);
//         await userDoc.update({
//           'password': newPassword,
//         });

//         snacka(context,'Password updated successfully in Firestore.');
//       } catch (e) {
//         snacka(context,"Failed to update Your password");
//       }
//     } else {
//       snacka(context,"No user is signed in");
//     }
//   }