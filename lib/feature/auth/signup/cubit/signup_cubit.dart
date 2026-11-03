
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  bool isObscure = true;

  void togglePasswordVisibility() {
    isObscure = !isObscure;
    emit(SignupPasswordVisibilityState());
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignupLoadingState());

    try {
      final credential =
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await credential.user!.updateDisplayName(name);

      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(SignupFailureState(
        errorMsg: e.message ?? e.code,
      ));
    } catch (e) {
      emit(SignupFailureState(
        errorMsg: e.toString(),
      ));
    }
  }
}
