import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalproject/Component/Alert_Dialog.dart';
import 'package:finalproject/Component/Snack_Bar.dart';
import 'package:finalproject/pages/Home_Screen.dart';
import 'package:finalproject/pages/Tell_us.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../pages/Login.dart';

// Add or update user data
Future<void> addUser({
  String? userId,
  String? name,
  String? nickName,
  String? image,
  int? age,
  int? weight,
  int? height,
  String? gender,
  String? email,
  String? password,
  String? phone,
  List<String>? selectedGoals,
  String? activitylevel,
}) async {
  await FirebaseFirestore.instance.collection('users').add({
    "userId": userId,
    'name': name,
    'nickName': nickName,
    'image': image,
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
  DocumentSnapshot document =
  await FirebaseFirestore.instance.collection('users').doc(userId).get();
  if (document.exists) {
    print(document.data()); // Use this data in your app
  } else {
    print("User does not exist");
  }
}

// Update specific fields in a document
Future<void> updateUserData(String userId, Map<String, dynamic> newData) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .update(newData);
}

Future<void> updateUserField({
  required String userId,
  String fieldKey = "",
  required dynamic newValue,
}) async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .update({fieldKey: newValue});
}

// Check user authentication state and retrieve token
Future<String?> getUserToken(BuildContext context) async {
  try {
    User? user = FirebaseAuth.instance.currentUser;

    // Check if the user is logged in
    if (user != null) {
      // Get the user's token
      String? idToken = await user.getIdToken();
      return idToken;
    } else {
      snacka(context, "No user is currently signed in");
      return null;
    }
  } catch (e) {
    print('Error retrieving token: $e');
    return null;
  }
}

// Login user with email and password
Future<void> loginUser(
    String email,
    String password,
    BuildContext context,
    List listtoken,
    String spe,
    ) async {
  Future<bool> checkEmailVerified() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return false;

    await user.reload();
    user = FirebaseAuth.instance.currentUser;
    return user?.emailVerified ?? false;
  }

  try {
    // Sign in with email and password
    print("Attempting to sign in with email: $email");
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print("User signed in successfully");

    if (await checkEmailVerified()) {
      print("Email verified");
      showDialogWithContext(context, "You have successfully logged in");

      String? docId = await getDocumentIdByEmail(email);
      print("Retrieved document ID: $docId");

      if (docId != null) {
        DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(docId);
        DocumentSnapshot docSnapshot = await userDoc.get();
        print("Fetched document snapshot");

        if (docSnapshot.exists) {
          Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
          String gender = data['gender'] ?? 'Unknown';



          if (gender == 'Unknown') {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TellUs(userid: docId),
              ),
            );
          } else {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Home_Screen(
                  userid: docId,
                  data: data,
                ),
              ),
            );
          }
        } else {
          snacka(context, "Document does not exist");
        }
      } else {
        snacka(context, "Document ID is null");
      }
    } else {
      snacka(context, "Email not verified");
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await currentUser.sendEmailVerification().then((_) {
          snacka(context, 'Successfully sent email verification');
        }).catchError((error) {
          snacka(context, 'Error sending email verification: $error');
        });
      } else {
        snacka(context, "No user is currently signed in");
      }
    }
  } on FirebaseAuthException catch (e) {
    handleAuthExceptions(e, context, email, password, listtoken);
  } catch (e) {
    snacka(context, "Unexpected error: $e");
  }
}

void handleAuthExceptions(FirebaseAuthException e, BuildContext context,
    String email, String password, List listtoken) {
  print(e);

  if (e.code == 'user-not-found') {
    snacka(context, 'No user found for that email.');
  } else if (e.code == 'wrong-password') {
    snacka(context, 'Wrong password provided.');
  } else if (e.code == 'invalid-email') {
    snacka(context, 'Invalid email format.');
  } else if (e.code == 'missing-password') {
    snacka(context, 'Password is missing.');
  } else if (e.code == 'invalid-credential') {
    snacka(context, "The password or email is wrong.");
  } else if (e.code == 'channel-error') {
    if (email.isEmpty && password.isEmpty) {
      snacka(context, "Please enter your email and password.");
    } else if (email.isNotEmpty && password.isEmpty) {
      snacka(context, "Please enter your password.");
    } else {
      snacka(context, "Please enter your email.");
    }
  } else if (e.code == "network-request-failed") {
    snacka(context, "Network request failed.");
  } else if (e.code == "unknown") {
    snacka(context, "This doesn't exist.");
  }
}

// Google Sign-In
Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth =
  await googleUser?.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<void> RegisterWith(
    String email, String password, BuildContext context) async {
  String spe = "";

  /* bool check_email(String email) {
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
*/
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

    //   final emailValid = check_email(email);
    final passwordValid = check_password(password);

    if (passwordValid && email.isNotEmpty && password.isNotEmpty) {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      showDialogWithContext(context, 'your account registered successfully');

      String? userId = credential.user?.uid;

      await credential.user?.sendEmailVerification().then((_) {
        Future.delayed(Duration(milliseconds: 670), () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          snacka(context, 'Successfully sent email verification');
          addUser(email: email, password: password, userId: userId);
        });
      }).catchError((onError) {
        snacka(context, 'Error sending email verification: $onError');
      });
    } else {
      if (email.isEmpty) {
        snacka(context, "Email cannot be empty");
      } else if (password.isEmpty) {
        snacka(context, "Password cannot be empty");
      }
      /*   else if (!emailValid) {
        snacka(context,"Your email must be in the format example@gmail.com");


      }*/
      else if (!passwordValid) {
        snacka(context,
            "Weak password. Enter a password with at least one special character.");
      }
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      snacka(context, "The password provided is too weak.");
      print("The password provided is too weak.");
    } else if (e.code == 'email-already-in-use') {
      snacka(
          context, "The email address is already in use by another account.");
    } else {
      snacka(context, "Error: ${e.message}");
    }
  } catch (e) {
    snacka(context, 'Unexpected error: $e');
  }
}


Future<void> reauthenticateAndChangePassword({
  required String email,
  required String oldPassword,
  required String newPassword,
  required String userdic, // Ensure this is of type String for Firestore document ID
  required BuildContext context,
}) async {
  try {
    final FirebaseAuth _auth = FirebaseAuth.instance; // Initialize FirebaseAuth

    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: oldPassword,
    );
    print('Signed in as: ${userCredential.user?.email}');

    // Re-authenticate the user
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: oldPassword,
      );

      await user.reauthenticateWithCredential(credential);
      print("User re-authenticated");

      // Update the user's password
      await user.updatePassword(newPassword);
      print("Password updated successfully");

      // Update Firestore document (avoid storing plain text passwords)
      DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(userdic);
      await userDoc.update({
        'password': newPassword,
        // Add other fields if needed
      });
      await FirebaseAuth.instance.signOut();

      // Navigate to Login screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );

      snacka(context, 'Password updated successfully.');
    } else {
      snacka(context, "No user is signed in");
    }
  } on FirebaseAuthException catch (authError) {
    print("Auth error: ${authError.message}");
    snacka(context, "Authentication failed: ${authError.message}");
  } catch (e) {
    print("General error: $e");
    snacka(context, "Failed to update your password: $e");
  }
}


Future<String?> getDocumentIdByEmail(String email) async {
  final firestore = FirebaseFirestore.instance;

  try {
    final querySnapshot = await firestore.collection('users').where('email', isEqualTo: email).get();

    if (querySnapshot.docs.isNotEmpty) {
      // Return the document ID if found
      return querySnapshot.docs.first.id;
    } else {
      print('No document found with the provided email');
      return null;
    }
  } catch (e) {
    print('Error fetching documents: $e');
    return null;
  }
}