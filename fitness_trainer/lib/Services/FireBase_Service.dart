import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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