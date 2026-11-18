import 'package:ai_lingo/feature/auth/models/user_model.dart';
import 'package:ai_lingo/feature/scenarios/model/scenario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUser(UserModel user) async {
    await firestore.collection('users').doc(user.uid).set(user.toMap());
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUser(String uid) async {
    return await firestore.collection('users').doc(uid).get();
  }

  Future<void> addScenario(Scenario scenario) async {
    await firestore
        .collection('scenarios')
        .doc(scenario.title)
        .set(scenario.toMap());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getScenarios() async {
    return await firestore.collection('scenarios').get();
  }

  Future<void> saveMessagingInstallationId(
    String uid,
    String installationId,
  ) async {
    await firestore.collection('users').doc(uid).set({
      'messagingInstallationIds': FieldValue.arrayUnion([installationId]),
    }, SetOptions(merge: true));
  }
}
