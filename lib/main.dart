import 'package:ai_lingo/core/services/firestore_service.dart';
import 'package:ai_lingo/feature/scenarios/repo/scenario_repo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'ai_lingo.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await GoogleSignIn.instance.initialize(
    serverClientId:
        '181527851214-uhktp3ihhne1gajerih8vfuse9403r84.apps.googleusercontent.com',
  );

  // Uploading Scenarios on FireStore only one time
  // final FirestoreService firestoreService = FirestoreService();
  // for (var scenario in scenarios) {
  //   await firestoreService.addScenario(scenario);
  // }

  runApp(const AiLingoApp());
}
