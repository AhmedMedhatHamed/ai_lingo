part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInLoadingState extends SignInState {}

final class SignInSuccessState extends SignInState {}

final class SignInErrorState extends SignInState {
  final String errorMsg;
  SignInErrorState({required this.errorMsg});
}

final class SignInPasswordVisibilityChanged extends SignInState {
  final bool isObscure;
  SignInPasswordVisibilityChanged(this.isObscure);
}
