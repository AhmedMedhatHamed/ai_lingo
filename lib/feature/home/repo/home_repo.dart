import 'package:ai_lingo/core/services/firestore_service.dart';
import 'package:ai_lingo/feature/auth/models/user_model.dart';
import 'package:ai_lingo/feature/home/model/history_model.dart';
import 'package:ai_lingo/feature/scenarios/model/scenario.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeRepository {
  final FirestoreService firestoreService;

  HomeRepository({required this.firestoreService});

  Future<UserModel?> getUser() async {
    final snapshot = await firestoreService.getUser(
      FirebaseAuth.instance.currentUser!.uid,
    );

    if (snapshot.exists && snapshot.data() != null) {
      return UserModel.fromMap(snapshot.data()!);
    }

    return null;
  }

  Future<void> updateStreak() async {
    await firestoreService.updateStreak(FirebaseAuth.instance.currentUser!.uid);
  }

  Future<void> checkStreak() async {
    await firestoreService.checkStreak(FirebaseAuth.instance.currentUser!.uid);
  }

  Future<void> addToHistory(HistoryModel historyItem) async {
    await firestoreService.addToHistory(
      FirebaseAuth.instance.currentUser!.uid,
      historyItem,
    );
  }

  Future<void> addWord(String savedWord) async {
    await firestoreService.addWord(
      FirebaseAuth.instance.currentUser!.uid,
      savedWord,
    );
  }

  Future<void> removeWord(String savedWord) async {
    await firestoreService.removeWord(
      FirebaseAuth.instance.currentUser!.uid,
      savedWord,
    );
  }

  Future<List<Scenario>> getpopularScenarios() async {
    final popularScenariosMap = await firestoreService.getpopularScenarios(
      FirebaseAuth.instance.currentUser!.uid,
    );

    final popularScenarios = popularScenariosMap
        .map((psMap) => Scenario.fromMap(psMap))
        .toList();
    return popularScenarios;
  }

  Future<void> completeConversation() async {
    await firestoreService.completeConversation(
      FirebaseAuth.instance.currentUser!.uid,
    );
  }

  Future<void> updateCompletedConversations() async {
    await firestoreService.updateCompletedConversations(
      FirebaseAuth.instance.currentUser!.uid,
    );
  }

  Future<void> calcProgressPercentage() async {
    await firestoreService.calcProgressPercentage(
      FirebaseAuth.instance.currentUser!.uid,
    );
  }

  Future<void> upgradeLevel() async {
    await firestoreService.upgradeLevel(FirebaseAuth.instance.currentUser!.uid);
  }
}
