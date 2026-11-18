import 'package:ai_lingo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  debugPrint('Background notification received: ${message.messageId}');
  debugPrint('Notification data: ${message.data}');
}

class NotificationHandler {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize(
    void Function(RemoteMessage message)? onNotificationTap,
  ) async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint("foreground notification received");
      debugPrint('Title: ${message.notification?.title}');
      debugPrint('Body: ${message.notification?.body}');
      debugPrint('Data: ${message.data}');
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint("Notification opened from background");
      onNotificationTap?.call(message);
    });
    final initialMessage = await _firebaseMessaging.getInitialMessage();
    if (initialMessage != null) {
      debugPrint('Notification opened from terminated state');
      onNotificationTap?.call(initialMessage);
    }
  }
}
