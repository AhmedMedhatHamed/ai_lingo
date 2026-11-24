import 'package:ai_lingo/feature/scenarios/model/scenario.dart';

sealed class ScenariosState {}

class ScenariosInitialState extends ScenariosState {}

class ScenariosLoadingState extends ScenariosState {}

class ScenariosSuccessState extends ScenariosState {
  final List<Scenario> scenarios;

  ScenariosSuccessState({required this.scenarios});
}

class ScenariosErrorState extends ScenariosState {
  final String message;

  ScenariosErrorState({required this.message});
}
