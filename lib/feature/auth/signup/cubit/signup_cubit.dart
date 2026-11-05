import 'package:ai_lingo/feature/auth/models/user_model.dart';
import 'package:ai_lingo/feature/auth/repo/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.userRepository) : super(SignupInitial());

  final UserRepository userRepository;
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
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user!;

      await user.updateDisplayName(name);

      final userModel = UserModel(
        uid: user.uid,
        name: name,
        email: email,
        language: 'English',
        level: 'Beginner',
        createdAt: Timestamp.now(),
      );

      await userRepository.createUser(userModel);

      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(SignupFailureState(errorMsg: e.message ?? e.code));
    } catch (e) {
      emit(SignupFailureState(errorMsg: e.toString()));
    }
  }
}
