import 'package:ai_lingo/feature/auth/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUser(UserModel user) async {
    await firestore.collection('users').doc(user.uid).set(user.toMap());
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String uid) async {
    return await firestore.collection('users').doc(uid).get();
  }
}
