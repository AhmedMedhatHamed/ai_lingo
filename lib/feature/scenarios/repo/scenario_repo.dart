import 'package:ai_lingo/core/services/firestore_service.dart';
import 'package:ai_lingo/feature/scenarios/model/scenario.dart';

class ScenarioRepository {
  final FirestoreService firestoreService;

  ScenarioRepository({required this.firestoreService});

  Future<void> addScenario(Scenario scenario) async {
    await firestoreService.addScenario(scenario);
  }

  Future<List<Scenario>> getScenarios() async {
    final snapshot = await firestoreService.getScenarios();
    return snapshot.docs.map((doc) => Scenario.fromMap(doc.data())).toList();
  }
}

final scenarios = [
  Scenario(
    title: 'Ordering Coffee',
    description: 'Practice ordering your favorite drink at a cafe.',
    icon: 'coffee',
    level: 'Beginner',
  ),
  Scenario(
    title: 'Airport Check-in',
    description: 'Learn how to ask questions and check your luggage.',
    icon: 'airplanemode_active',
    level: 'Intermediate',
  ),
  Scenario(
    title: 'Job Interview',
    description: 'Answer common interview questions with confidence.',
    icon: 'work_outline',
    level: 'Advanced',
  ),
  Scenario(
    title: 'Grocery Shopping',
    description: 'Practice asking for items and prices at the store.',
    icon: 'store_outlined',
    level: 'Beginner',
  ),
  Scenario(
    title: 'Doctor Consultation',
    description: 'Explain complex symptoms and discuss medical advice.',
    icon: 'health_and_safety',
    level: 'Intermediate',
  ),
];
