import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'phone_verification_state.dart';

class PhoneVerificationCubit extends Cubit<PhoneVerificationState> {
  PhoneVerificationCubit() : super(PhoneVerificationInitial());

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  String? verificationId;
  String? phoneNumber;
  int? resendToken;

  void _safeEmit(PhoneVerificationState state) {
    if (!isClosed) emit(state);
  }

  Future<void> sendCode(String phone) async {
    if (phone.trim().isEmpty) {
      _safeEmit(
        PhoneVerificationFailureState(
          errorMsg: 'Please enter your phone number.',
        ),
      );
      return;
    }

    phoneNumber = phone.trim();

    _safeEmit(PhoneVerificationLoadingState());

    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber!,
        timeout: const Duration(seconds: 60),
        forceResendingToken: resendToken,

        verificationCompleted: (PhoneAuthCredential credential) async {
          await linkPhoneNumber(credential);
        },

        verificationFailed: (FirebaseAuthException e) {
          _safeEmit(
            PhoneVerificationFailureState(errorMsg: e.message ?? e.code),
          );
        },

        codeSent: (String id, int? token) {
          verificationId = id;
          resendToken = token;

          _safeEmit(PhoneCodeSentState());
        },

        codeAutoRetrievalTimeout: (String id) {
          verificationId = id;
        },
      );
    } on FirebaseAuthException catch (e) {
      _safeEmit(PhoneVerificationFailureState(errorMsg: e.message ?? e.code));
    } catch (e) {
      _safeEmit(PhoneVerificationFailureState(errorMsg: e.toString()));
    }
  }

  Future<void> verifyCode(String smsCode) async {
    if (verificationId == null) {
      _safeEmit(
        PhoneVerificationFailureState(
          errorMsg: 'Please request the verification code first.',
        ),
      );
      return;
    }

    if (smsCode.trim().length != 6) {
      _safeEmit(
        PhoneVerificationFailureState(
          errorMsg: 'Please enter a valid 6-digit code.',
        ),
      );
      return;
    }

    _safeEmit(PhoneVerifyingState());

    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: smsCode.trim(),
      );

      await linkPhoneNumber(credential);
    } on FirebaseAuthException catch (e) {
      _safeEmit(PhoneVerificationFailureState(errorMsg: e.message ?? e.code));
    } catch (e) {
      _safeEmit(PhoneVerificationFailureState(errorMsg: e.toString()));
    }
  }

  Future<void> linkPhoneNumber(PhoneAuthCredential credential) async {
    try {
      final user = firebaseAuth.currentUser;

      if (user == null) {
        _safeEmit(
          PhoneVerificationFailureState(errorMsg: 'Please sign up first.'),
        );
        return;
      }

      await user.linkWithCredential(credential);

      await firebaseAuth.currentUser?.reload();

      final updatedUser = firebaseAuth.currentUser;

      if (updatedUser?.phoneNumber != null) {
        _safeEmit(PhoneVerificationSuccessState());
      } else {
        _safeEmit(
          PhoneVerificationFailureState(
            errorMsg: 'Phone number verification failed.',
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'provider-already-linked') {
        await firebaseAuth.currentUser?.reload();

        if (firebaseAuth.currentUser?.phoneNumber != null) {
          _safeEmit(PhoneVerificationSuccessState());
          return;
        }
      }

      _safeEmit(PhoneVerificationFailureState(errorMsg: e.message ?? e.code));
    } catch (e) {
      _safeEmit(PhoneVerificationFailureState(errorMsg: e.toString()));
    }
  }
}