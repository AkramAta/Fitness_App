abstract class HomeCubitState {}

class HomeInitialState extends HomeCubitState {}

class HomeLoadingState extends HomeCubitState {}

class HomeLoadedState extends HomeCubitState {
  final List<Map<String, String>> exercises;

  HomeLoadedState(this.exercises);
}

class HomeErrorState extends HomeCubitState {
  final String error;

  HomeErrorState(this.error);
}
