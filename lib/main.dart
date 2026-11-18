import 'package:ai_lingo/core/services/firestore_service.dart';
import 'package:ai_lingo/feature/scenarios/repo/scenario_repo.dart';
import 'package:ai_lingo/core/notifications/notification_handler.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'ai_lingo.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  await GoogleSignIn.instance.initialize(
    serverClientId:
        '181527851214-uhktp3ihhne1gajerih8vfuse9403r84.apps.googleusercontent.com',
  );
  final notificationHandler = NotificationHandler();
  await notificationHandler.initialize((RemoteMessage message) {
    debugPrint('Notification tapped: ${message.messageId}');
    debugPrint('Notification data: ${message.data}');
  });

  // Uploading Scenarios on FireStore only one time
  // final FirestoreService firestoreService = FirestoreService();
  // for (var scenario in scenarios) {
  //   await firestoreService.addScenario(scenario);
  // }

  runApp(const AiLingoApp());
}
