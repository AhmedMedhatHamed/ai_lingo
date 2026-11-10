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

      if (password != null && user.email != null) {
        final credential = EmailAuthProvider.credential(
          email: user.email!,
          password: password,
        );
        await user.reauthenticateWithCredential(credential);
      }

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .delete();

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

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    emit(ChangePasswordLoading());

    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null || user.email == null) {
        emit(ChangePasswordFailure(
          errorMsg: 'User not found. Please login again.',
        ));
        return;
      }

      final credential = EmailAuthProvider.credential(
        email: user.email!,
        password: oldPassword,
      );

      await user.reauthenticateWithCredential(credential);

      await user.updatePassword(newPassword);

      emit(ChangePasswordSuccess());
    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case 'wrong-password':
          message = 'The old password is incorrect';
          break;
        case 'weak-password':
          message = 'The new password is too weak';
          break;
        case 'requires-recent-login':
          message = 'Please login again and try';
          break;
        default:
          message = e.message ?? 'Something went wrong';
      }

      emit(ChangePasswordFailure(errorMsg: message));
    } catch (e) {
      emit(ChangePasswordFailure(errorMsg: e.toString()));
    }
  }
}
