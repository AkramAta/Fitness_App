abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {}

class UserError extends UserState {
  final String error;
  UserError(this.error);
}

class UserLogOut extends UserState {}

class UserLogIn extends UserState {}

class UserRegister extends UserState {}

class ChangeUserGender extends UserState {}

class AgeUpdate extends UserState {
   int age = 0;
  AgeUpdate(this.age);
}

class HeightUpdate extends UserState {
   int height = 0;
  HeightUpdate(this.height);
}

class WeightUpdate extends UserState {
   int weight = 0;
  WeightUpdate(this.weight);
}

class ActivityLevelUpdate extends UserState {
   String activity_level = "";
  ActivityLevelUpdate(this.activity_level);
}

class UserHeight extends UserState {}

class UserWeight extends UserState {}

class UserGoals extends UserState {

}

class UserUpdated extends UserState {
  List<bool> isCheckedList= [];
  List<String> selectedGoals = [];
  UserUpdated({required this.isCheckedList,
    required this.selectedGoals,});
}


class UserPassword extends UserState {}

class UserName extends UserState {}

class UserEmail extends UserState {}

class UserPhone extends UserState {}

class UserImage extends UserState {}