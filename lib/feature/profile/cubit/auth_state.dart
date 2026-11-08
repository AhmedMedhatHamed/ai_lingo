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
