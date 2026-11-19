import 'package:ai_lingo/feature/auth/models/user_model.dart';

sealed class HomeState {}

class HomeInitialState extends HomeState {}

class HomeUserSuccessState extends HomeState {
  final UserModel? user;

  HomeUserSuccessState({required this.user});
}

class HomeUserErrorState extends HomeState {
  final String message;

  HomeUserErrorState({required this.message});
}
