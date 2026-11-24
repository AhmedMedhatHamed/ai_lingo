import 'package:ai_lingo/feature/auth/models/user_model.dart';
import 'package:ai_lingo/feature/home/model/history_model.dart';
import 'package:ai_lingo/feature/scenarios/model/scenario.dart';
import 'package:ai_lingo/feature/scenarios/repo/scenario_repo.dart';
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

  Future<void> updateNotificationsEnabled(String uid, bool enabled) async {
    await firestore.collection('users').doc(uid).set({
      'notificationsEnabled': enabled,
    }, SetOptions(merge: true));
  }

Future<void> removeMessagingInstallationId(
  String uid,
  String installationId,
) async {
  await firestore.collection('users').doc(uid).update({
    'messagingInstallationIds':
        FieldValue.arrayRemove([installationId]),
  });
}

  Future<void> updateStreak(String uid) async {
    final userRef = firestore.collection('users').doc(uid);
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

  Future<void> checkStreak(String uid) async {
    final userRef = firestore.collection('users').doc(uid);
    final user = await userRef.get();

    if (!user.exists) return;

    if (user.data() == null) return;

    final lastActive = user.data()!['lastActive'];

    if (lastActive == null) return;

    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    final lastDate = lastActive.toDate();
    final lastActiveDate = DateTime(
      lastDate.year,
      lastDate.month,
      lastDate.day,
    );

    final differenceDays = todayDate.difference(lastActiveDate).inDays;

    if (differenceDays > 1) {
      await userRef.update({'currentStreak': 0});
    }
  }

  Future<void> addToHistory(String uid, HistoryModel historyItem) async {
    await firestore.collection('users').doc(uid).update({
      'history': FieldValue.arrayUnion([historyItem.toMap()]),
    });
  }

  Future<void> addWord(String uid, String savedWord) async {
    final userRef = firestore.collection('users').doc(uid);

    await userRef.update({
      'savedWords': FieldValue.arrayUnion([savedWord]),
    });
  }

  Future<void> removeWord(String uid, String savedWord) async {
    final userRef = firestore.collection('users').doc(uid);

    await userRef.update({
      'savedWords': FieldValue.arrayRemove([savedWord]),
    });
  }

  Future<List<Map<String, dynamic>>> getpopularScenarios(String uLevel) async {
    final totalScenarios = await getScenarios();

    final List<Map<String, dynamic>> popularScenarios = [];

    for (var scenarioDoc in totalScenarios.docs) {
      if (scenarioDoc.data()['level'] == uLevel) {
        popularScenarios.add(scenarioDoc.data());
      }
    }

    return popularScenarios;
  }
}

