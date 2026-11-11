import 'package:ai_lingo/core/notifications/notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  bool isObscure = true;
  final NotificationService _notificationService = NotificationService();
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

      try {
        await _notificationService.initialize();
      } catch (e) {
        debugPrint('Notification initialization failed: $e');
      }

      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(SignInErrorState(errorMsg: e.message ?? e.code));
    } catch (e) {
      emit(SignInErrorState(errorMsg: e.toString()));
    }
  }
}
