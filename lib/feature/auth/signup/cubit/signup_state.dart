
part of 'signup_cubit.dart';

sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoadingState extends SignupState {}

final class SignupSuccessState extends SignupState {}

final class SignupPasswordVisibilityState extends SignupState {}

final class SignupFailureState extends SignupState {
  final String errorMsg;

  SignupFailureState({required this.errorMsg});
}
