import 'package:ai_lingo/feature/auth/models/user_model.dart';
import 'package:ai_lingo/feature/scenarios/model/scenario.dart';

sealed class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeUserSuccessState extends HomeState {
  final UserModel? user;

  HomeUserSuccessState({required this.user});
}

class HomeUserErrorState extends HomeState {
  final String message;

  HomeUserErrorState({required this.message});
}

class HomePopScenariosSuccessState extends HomeState {
  final List<Scenario> popularScenarios;

  HomePopScenariosSuccessState({required this.popularScenarios});
}

class HomePopScenariosErrorState extends HomeState {
  final String message;

  HomePopScenariosErrorState({required this.message});
}
