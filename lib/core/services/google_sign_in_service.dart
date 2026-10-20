
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class GoogleSignInService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Initialize Google Sign-In.
      await _googleSignIn.initialize();

      // Open Google's account picker.
      final googleUser = await _googleSignIn.authenticate();

      // Get authentication tokens.
      final googleAuth = googleUser.authentication;
      final idToken = googleAuth.idToken;

      if (idToken == null) {
        throw Exception('Google ID token was not returned.');
      }

      // Sign in to Firebase using the Google ID token.
      final credential = GoogleAuthProvider.credential(
        idToken: idToken,
      );

      return await _auth.signInWithCredential(credential);
    } on GoogleSignInException catch (e) {
      // The user may cancel the Google sign-in flow.
      if (e.code == GoogleSignInExceptionCode.canceled) {
        return null;
      }

      rethrow;
    }
  }
}
