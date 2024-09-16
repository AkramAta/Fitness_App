import 'dart:io';

import 'package:finalproject/Business_Logic/Cubit/User_State.dart';

import 'package:finalproject/Services/FireBase_Service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  late String userName = "";
  late String nickName = "";
  late String email = "";
  late String userphone = "";
  late String userpassword = "";
  late String gender = "";
  late File image ;
  late int weight = 0;
  late int height = 0;
  late int age = 0;
  late String goal = "";
  late String activityLevel = "";
  late List<bool> isCheckedList = [];
  late List<String> selectedGoals = [];
  late String currentBorderColor = "";
  late bool obscureText = true;
  late bool obscureText2 = true;
  late bool? isChecked = false;

  void updateimage(String imageUrl, String userId) {
    // Update image URL in the user profile (database or wherever you are storing it)
    updateUserField(userId: userId, fieldKey: "image", newValue: imageUrl);
    emit(AgeUpdate(age)); // Emit state change
  }

  void updateimageUsercubit(File NewImage, String userid) {
    image = NewImage;
    emit(AgeUpdate(age));
  }


  void updateAge(int newAge, String userid) {
    age = newAge;
    emit(AgeUpdate(age));
    updateUserField(userId: userid, fieldKey: "age", newValue: newAge);
  }

  void updateAgeusercubit(int newAge) {
    age = newAge;
    emit(AgeUpdate(age));
  }

  void updateWeightusercubit(int newWeight, String userid) {
    weight = newWeight;
    emit(WeightUpdate(weight));
  }

  void updateWeight(int newWeight, String userid) {
    weight = newWeight;
    emit(WeightUpdate(weight));
    updateUserField(userId: userid, fieldKey: "weight", newValue: newWeight);
  }

  void updateHeightusercubit(int newHeight, String userid) {
    height = newHeight;
    emit(HeightUpdate(height));
  }

  void updateHeight(int newHeight, String userid) {
    height = newHeight;
    emit(HeightUpdate(height));
    updateUserField(userId: userid, fieldKey: "height", newValue: newHeight);
  }

  updateActivityLevel(String newactivityLevel, String userid) {
    activityLevel = newactivityLevel;
    emit(ActivityLevelUpdate(activityLevel));
    updateUserField(
        userId: userid, fieldKey: "activitylevel", newValue: newactivityLevel);
  }

  updateActivityLevelusercubit(String newactivityLevel, String userid) {
    activityLevel = newactivityLevel;
    emit(ActivityLevelUpdate(activityLevel));
  }

  // Initialize the list
  void initializeGoals(int length) {
    isCheckedList = List<bool>.filled(length, false);
    emit(UserGoals());

    // emit(UserUpdated(isCheckedList: isCheckedList, selectedGoals: selectedGoals));
  }

  // Function to update the checkbox state
  void updateCheckbox(int index, bool value) {
    isCheckedList[index] = value;
    //  emit(UserUpdated(isCheckedList: isCheckedList, selectedGoals: selectedGoals));
    emit(UserGoals());
  }

  // Function to update the selected goals
  void updateGoalTarget(String goal, String userid) {
    if (selectedGoals.contains(goal)) {
      selectedGoals.remove(goal);
    } else {
      selectedGoals.add(goal);
    }
    print(selectedGoals);
    // emit(UserUpdated(isCheckedList: isCheckedList, selectedGoals: selectedGoals));
    emit(UserGoals());
    updateUserField(
        fieldKey: "selectedGoals", userId: userid, newValue: selectedGoals);
  }

  void updateGoalTargetusercubit(String goal, String userid) {
    if (selectedGoals.contains(goal)) {
      selectedGoals.remove(goal);
    } else {
      selectedGoals.add(goal);
    }
    print(selectedGoals);
    // emit(UserUpdated(isCheckedList: isCheckedList, selectedGoals: selectedGoals));
    emit(UserGoals());

  }


  updateGender(String gender, String userid) {
    if (gender == "Male") {
      this.gender = "Male";
    } else {
      this.gender = "Female";
    }

    emit(ChangeUserGender());
    updateUserField(userId: userid, fieldKey: "gender", newValue: gender);
  }

  updateGenderusercubit(String gender, String userid) {
    if (gender == "Male") {
      this.gender = "Male";
    } else {
      this.gender = "Female";
    }
    emit(ChangeUserGender());
  }

  UpdateName(String name, String userid) {
    this.userName = name;
    emit(UserName());
    updateUserField(userId: userid, fieldKey: "name", newValue: name);
  }

  UpdateNameusercubit(String name, String userid) {
    this.userName = name;
    emit(UserName());
  }

  UpdateNickname(String nickname, String userid) {
    this.nickName = nickname;
    emit(UserName());
    updateUserField(userId: userid, fieldKey: "nickName", newValue: nickname);
  }

  UpdateNicknameusercubit(String nickname, String userid) {
    this.nickName = nickname;
    emit(UserName());
  }

  UpdateNumber(String number, String userid) {
    this.userphone = number;
    emit(UserPhone());
    updateUserField(userId: userid, fieldKey: "phone", newValue: number);
  }

  UpdateNumberusercubit(String number, String userid) {
    this.userphone = number;
    emit(UserPhone());
  }

  UpdateEmail(String email, String userid) {
    this.email = email;
    emit(UserEmail());
    updateUserField(userId: userid, fieldKey: "email", newValue: email);
  }

  UpdateEmailusercubit(String email, String userid) {
    this.email = email;
    emit(UserEmail());
    updateUserField(userId: userid, fieldKey: "email", newValue: email);
  }


  updatePassword(String password, String userid) {
    userpassword = password;
    emit(UserPassword());
    updateUserField(
        userId: userid, fieldKey: "userpassword", newValue: password);
  }

  updatePasswordusercubit(String password, String userid) {
    userpassword = password;
    emit(UserPassword());
    updateUserField(
        userId: userid, fieldKey: "userpassword", newValue: password);
  }

  void toggleVisibility() {
    obscureText = !obscureText;
    emit(UserPassword());
  }

  void toggleVisibility2() {
    obscureText2 = !obscureText2;
    emit(UserPassword());
  }

  void Check(bool newisChecked) {
    isChecked = newisChecked;
    emit(UserPassword());
  }

}