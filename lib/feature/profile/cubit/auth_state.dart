part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class DeleteAccountLoadingState extends AuthState {}

class DeleteAccountSuccessState extends AuthState {}

class DeleteAccountRequiresReAuthState extends AuthState {}

class DeleteAccountFailureState extends AuthState {
  final String errorMsg;
  DeleteAccountFailureState({required this.errorMsg});
}

class ChangePasswordLoading extends AuthState {}

class ChangePasswordSuccess extends AuthState {}

class ChangePasswordFailure extends AuthState {
  final String errorMsg;

  ChangePasswordFailure({required this.errorMsg});
}

class ChangeNameLoading extends AuthState {}

class ChangeNameSuccess extends AuthState {}

class ChangeNameFailure extends AuthState {
  final String errorMsg;

  ChangeNameFailure({required this.errorMsg});
}
