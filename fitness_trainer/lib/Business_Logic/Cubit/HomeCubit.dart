import 'package:finalproject/Business_Logic/Cubit/HomeCubitState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeInitialState());

  // Example of loading exercises based on difficulty
  void loadExercises(String difficulty) {
    emit(HomeLoadingState());

    try {
      // Dummy data (replace this with your actual data loading logic)
      List<Map<String, String>> exercises = [
        {
          "name": "Push-ups",
          "equipment": "None",
          "instructions": "Start in a plank position and lower your body, then push back up."
        },
        {
          "name": "Bodyweight Squats",
          "equipment": "None",
          "instructions": "Stand with feet shoulder-width apart and squat down."
        }
      ]; // You can modify this to fetch different exercises based on difficulty

      emit(HomeLoadedState(exercises));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
}
