import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isObscure = true;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void togglePasswordVisibility() {
    isObscure = !isObscure;
    emit(AuthPasswordVisibilityChanged(isObscure));
  }

  Future<void> signUp() async {
    if (!formKey.currentState!.validate()) {
      autoValidateMode = AutovalidateMode.always;
      emit(AuthValidationFailed());
      return;
    }

    emit(AuthLoading());
    try {
      // TODO: call signup API
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signIn() async {
    if (!formKey.currentState!.validate()) {
      autoValidateMode = AutovalidateMode.always;
      emit(AuthValidationFailed());
      return;
    }

    emit(AuthLoading());
    try {
      // TODO: call signIn API
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}