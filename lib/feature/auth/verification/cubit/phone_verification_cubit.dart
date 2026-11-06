import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_verification_state.dart';

class PhoneVerificationCubit extends Cubit<PhoneVerificationState> {
  PhoneVerificationCubit() : super(PhoneVerificationInitial());

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String? verificationId;
  String? phoneNumber;
  int? resendToken;

  Future<void> sendCode(String phone) async {
    if (phone.trim().isEmpty) {
      emit(
        PhoneVerificationFailureState(
          errorMsg: 'Please enter your phone number.',
        ),
      );
      return;
    }

    phoneNumber = phone.trim();

    emit(PhoneVerificationLoadingState());

    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber!,
        timeout: const Duration(seconds: 60),
        forceResendingToken: resendToken,

        verificationCompleted: (PhoneAuthCredential credential) async {
          await linkPhoneNumber(credential);
        },

        verificationFailed: (FirebaseAuthException e) {
          emit(
            PhoneVerificationFailureState(
              errorMsg: e.message ?? e.code,
            ),
          );
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
      emit(
        PhoneVerificationFailureState(
          errorMsg: e.message ?? e.code,
        ),
      );
    } catch (e) {
      emit(
        PhoneVerificationFailureState(
          errorMsg: e.toString(),
        ),
      );
    }
  }

  Future<void> verifyCode(String smsCode) async {
    if (verificationId == null) {
      emit(
        PhoneVerificationFailureState(
          errorMsg: 'Please request the verification code first.',
        ),
      );
      return;
    }

    if (smsCode.trim().length != 6) {
      emit(
        PhoneVerificationFailureState(
          errorMsg: 'Please enter a valid 6-digit code.',
        ),
      );
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
      emit(
        PhoneVerificationFailureState(
          errorMsg: e.message ?? e.code,
        ),
      );
    } catch (e) {
      emit(
        PhoneVerificationFailureState(
          errorMsg: e.toString(),
        ),
      );
    }
  }

  Future<void> linkPhoneNumber(
      PhoneAuthCredential credential,
      ) async {
    try {
      final user = firebaseAuth.currentUser;

      if (user == null) {
        emit(
          PhoneVerificationFailureState(
            errorMsg: 'Please sign up first.',
          ),
        );
        return;
      }

      await user.linkWithCredential(credential);

      await firebaseAuth.currentUser?.reload();

      final updatedUser = firebaseAuth.currentUser;

      if (updatedUser?.phoneNumber != null) {
        emit(PhoneVerificationSuccessState());
      } else {
        emit(
          PhoneVerificationFailureState(
            errorMsg: 'Phone number verification failed.',
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'provider-already-linked') {
        await firebaseAuth.currentUser?.reload();

        if (firebaseAuth.currentUser?.phoneNumber != null) {
          emit(PhoneVerificationSuccessState());
          return;
        }
      }

      emit(
        PhoneVerificationFailureState(
          errorMsg: e.message ?? e.code,
        ),
      );
    } catch (e) {
      emit(
        PhoneVerificationFailureState(
          errorMsg: e.toString(),
        ),
      );
    }
  }
}