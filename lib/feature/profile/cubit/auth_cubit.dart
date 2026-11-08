import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> deleteAccount({String? password}) async {
    emit(DeleteAccountLoadingState());

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        emit(DeleteAccountFailureState(errorMsg: 'No user logged in.'));
        return;
      }

      // لو المستخدم كتب الباسورد، اعمل re-auth الأول
      if (password != null && user.email != null) {
        final credential = EmailAuthProvider.credential(
          email: user.email!,
          password: password,
        );
        await user.reauthenticateWithCredential(credential);
      }

      // 1) امسح بياناته أولاً (غيّر اسم الـ collection حسب مشروعك)
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .delete();

      // 2) امسح الحساب
      await user.delete();

      emit(DeleteAccountSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        emit(DeleteAccountRequiresReAuthState());
      } else {
        emit(DeleteAccountFailureState(errorMsg: e.message ?? e.code));
      }
    } catch (e) {
      emit(DeleteAccountFailureState(errorMsg: e.toString()));
    }
  }
}
