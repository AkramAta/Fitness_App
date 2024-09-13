

import 'package:finalproject/Business_Logic/Cubit/User_State.dart';
import 'package:finalproject/Component/Colors.dart';
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
  late String image = "";
  late int weight = 0;
  late int height = 0;
  late int age = 0;
  late String goal = "";
  late String activityLevel = "";
  late List<bool> isCheckedList = [];
  late List<String> selectedGoals = [];
  late String currentBorderColor = "";
  late bool obscureText= true;
  late bool? isChecked = false;
  

 void updateAge(int newAge) {
    age = newAge;
    emit(AgeUpdate(age));  // Call emitUserState to update state with all properties
    print(age);
    addUser(age: age);
  }

  void updateHeight(int newWeight) {
    height = newWeight;
    emit(HeightUpdate(height));  
    addUser(height: height);
  }

  void updateWeight(int newHeight) {
    weight = newHeight;
    emit(WeightUpdate(weight));
    addUser(weight: weight);    
  }

  updateActivityLevel(String newactivityLevel) {
    activityLevel = newactivityLevel;
    emit(ActivityLevelUpdate(activityLevel));
    addUser(activitylevel: activityLevel);
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
  void updateGoalTarget(String goal) {
    if (selectedGoals.contains(goal)) {
      selectedGoals.remove(goal);
    } else {
      selectedGoals.add(goal);
    }
   print(selectedGoals);
    // emit(UserUpdated(isCheckedList: isCheckedList, selectedGoals: selectedGoals));
    emit(UserGoals());
    addUser(selectedGoals: selectedGoals);
  }


  GetGender(String gender) {

    if (gender == "Male") {
      this.gender = "Male";
    } else {
      this.gender = "Female";
    }

    emit(ChangeUserGender());
    addUser(gender: gender);
  }


  UpdateName(String name) {
    this.userName = name;
    emit(UserName());
    addUser(name: name);
  }

  UpdateNickname(String nickname) {
    this.nickName = nickname;
    emit(UserName());
    addUser(nickName: nickname);
  }

  
  UpdateNumber(String number) {
    this.userphone = number;
    emit(UserPhone());
    addUser(phone: number);
    
  }

  UpdateEmail(String email) {
    this.email = email;
    emit(UserEmail());
    addUser(email: email);
  }

  UpdateImage(String image) {
    emit(UserImage());
    addUser(image: image);
  }

  updatePassword(String password){
    userpassword = password; 
    emit(UserPassword());
    addUser(password: userpassword);
  }
  

  void toggleVisibility() {
    
      obscureText = !obscureText;
      emit(UserPassword());
  }


  void Check(bool newisChecked) {
    
      isChecked = newisChecked;
       emit(UserPassword());
  }
  
  }

  
