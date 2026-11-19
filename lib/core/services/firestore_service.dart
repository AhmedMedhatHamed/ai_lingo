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

  Future<void> updateStreak(String uid) async {
    final userRef = await firestore.collection('users').doc(uid);
    final user = await userRef.get();

    final currentStreak = user.data()?['currentStreak'] ?? 0;
    final lastActive = user.data()?['lastActive'] as Timestamp?;

    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    if (lastActive == null) {
      await userRef.update({
        'currentStreak': 1,
        'lastActive': Timestamp.fromDate(todayDate),
      });
      return;
    }

    final lastDate = lastActive.toDate();
    final differenceDays = today
        .difference(DateTime(lastDate.year, lastDate.month, lastDate.day))
        .inDays;

    if (differenceDays == 1) {
      await userRef.update({
        'currentStreak': currentStreak + 1,
        'lastActive': Timestamp.fromDate(todayDate),
      });
    } else if (differenceDays > 1) {
      await userRef.update({
        'currentStreak': 1,
        'lastActive': Timestamp.fromDate(todayDate),
      });
    }
  }
}
