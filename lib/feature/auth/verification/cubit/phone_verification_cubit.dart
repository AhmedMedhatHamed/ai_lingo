
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_verification_state.dart';

class PhoneVerificationCubit extends Cubit<PhoneVerificationState> {
  PhoneVerificationCubit() : super(PhoneVerificationInitial());

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String? verificationId;
  int? resendToken;

  Future<void> sendCode(String phoneNumber) async {
    if (phoneNumber.trim().isEmpty) {
      emit(PhoneVerificationFailureState(
        errorMsg: 'Please enter your phone number.',
      ));
      return;
    }

    emit(PhoneVerificationLoadingState());

    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber.trim(),
        timeout: const Duration(seconds: 60),
        forceResendingToken: resendToken,

        verificationCompleted: (PhoneAuthCredential credential) async {
          await linkPhoneNumber(credential);
        },

        verificationFailed: (FirebaseAuthException e) {
          emit(PhoneVerificationFailureState(
            errorMsg: e.message ?? e.code,
          ));
        },

        codeSent: (String id, int? token) {
          verificationId = id;
          resendToken = token;

          emit(PhoneCodeSentState());
        },

        codeAutoRetrievalTimeout: (String id) {
          verificationId = id;
        },
      );
    } on FirebaseAuthException catch (e) {
      emit(PhoneVerificationFailureState(
        errorMsg: e.message ?? e.code,
      ));
    } catch (e) {
      emit(PhoneVerificationFailureState(
        errorMsg: e.toString(),
      ));
    }
  }

  Future<void> verifyCode(String smsCode) async {
    if (verificationId == null) {
      emit(PhoneVerificationFailureState(
        errorMsg: 'Please request the verification code first.',
      ));
      return;
    }

    if (smsCode.trim().length != 6) {
      emit(PhoneVerificationFailureState(
        errorMsg: 'Please enter a valid 6-digit code.',
      ));
      return;
    }

    emit(PhoneVerifyingState());

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: smsCode.trim(),
      );

      await linkPhoneNumber(credential);
    } on FirebaseAuthException catch (e) {
      emit(PhoneVerificationFailureState(
        errorMsg: e.message ?? e.code,
      ));
    } catch (e) {
      emit(PhoneVerificationFailureState(
        errorMsg: e.toString(),
      ));
    }
  }

  Future<void> linkPhoneNumber(
      PhoneAuthCredential credential,
      ) async {
    try {
      final user = firebaseAuth.currentUser;

      if (user == null) {
        emit(PhoneVerificationFailureState(
          errorMsg: 'Please sign up first.',
        ));
        return;
      }

      await user.linkWithCredential(credential);

      await user.reload();

      emit(PhoneVerificationSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'provider-already-linked') {
        emit(PhoneVerificationSuccessState());
        return;
      }

      emit(PhoneVerificationFailureState(
        errorMsg: e.message ?? e.code,
      ));
    } catch (e) {
      emit(PhoneVerificationFailureState(
        errorMsg: e.toString(),
      ));
    }
  }
}
