part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

/// بتتبعت لما المستخدم يعمل toggle للباسورد
final class AuthPasswordVisibilityChanged extends AuthState {
  final bool isObscure;
  AuthPasswordVisibilityChanged(this.isObscure);
}

/// بتتبعت لما الـ validation يفشل، عشان نشغّل الـ autovalidate
final class AuthValidationFailed extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {}

final class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}