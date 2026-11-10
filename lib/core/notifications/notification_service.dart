import 'dart:async';

import 'package:ai_lingo/core/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class NotificationService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  StreamSubscription<String>? _registrationSubscription;

  Future<void> initialize() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    debugPrint('Notification permission: ${settings.authorizationStatus}');

    _registrationSubscription ??= _messaging.onRegistered.listen(
      (installationId) async {
        final user = _auth.currentUser;

        if (user == null) {
          debugPrint('No authenticated user. ID was not saved.');
          return;
        }

        try {
          await _firestoreService.saveMessagingInstallationId(
            user.uid,
            installationId,
          );

          debugPrint('Firebase Installation ID saved successfully');
        } catch (e) {
          debugPrint('Firestore save failed: $e');
        }
      },
      onError: (error) {
        debugPrint('Registration error: $error');
      },
    );
    await _messaging.register();
  }

  Future<void> dispose() async {
    await _registrationSubscription?.cancel();
    _registrationSubscription = null;
  }
}
