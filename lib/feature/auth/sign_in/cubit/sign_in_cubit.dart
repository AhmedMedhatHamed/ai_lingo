import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  bool isObscure = true;

  void togglePasswordVisibility() {
    isObscure = !isObscure;
    emit(SignInPasswordVisibilityChanged(isObscure));
  }

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoadingState());

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(SignInErrorState(errorMsg: e.message ?? e.code));
    } catch (e) {
      emit(SignInErrorState(errorMsg: e.toString()));
    }
  }
}
