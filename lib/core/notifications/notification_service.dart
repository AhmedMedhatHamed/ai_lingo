
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
  StreamSubscription<String>? _unregistrationSubscription;

  Future<void> _listenToRegistrationEvents() async {
    _registrationSubscription ??= _messaging.onRegistered.listen(
      (installationId) async {
        final user = _auth.currentUser;
        if (user == null) return;

        try {
          final userDoc = await _firestoreService.getUser(user.uid);
          final enabled =
              userDoc.data()?['notificationsEnabled'] as bool? ?? true;

          if (!enabled) {
            await _messaging.unregister();
            return;
          }

          await _firestoreService.saveMessagingInstallationId(
            user.uid,
            installationId,
          );

          debugPrint('Messaging installation saved');
        } catch (e) {
          debugPrint('Registration handling failed: $e');
        }
      },
      onError: (error) {
        debugPrint('Registration error: $error');
      },
    );

    _unregistrationSubscription ??= _messaging.onUnregistered.listen(
      (installationId) async {
        final user = _auth.currentUser;
        if (user == null) return;

        try {
          await _firestoreService.removeMessagingInstallationId(
            user.uid,
            installationId,
          );

          debugPrint('Messaging installation removed');
        } catch (e) {
          debugPrint('Unregistration handling failed: $e');
        }
      },
      onError: (error) {
        debugPrint('Unregistration error: $error');
      },
    );
  }

  Future<void> initialize() async {
    final user = _auth.currentUser;
    if (user == null) return;

    await _listenToRegistrationEvents();

    final userDoc = await _firestoreService.getUser(user.uid);
    final enabled =
        userDoc.data()?['notificationsEnabled'] as bool? ?? true;

    if (enabled) {
      await enableNotifications();
    } else {
      await disableNotifications();
    }
  }

  Future<void> enableNotifications() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw StateError('User is not signed in');
    }

    await _listenToRegistrationEvents();

    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    debugPrint(
      'Notification permission: ${settings.authorizationStatus}',
    );

    await _messaging.register();
  }

  Future<void> disableNotifications() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw StateError('User is not signed in');
    }

    await _listenToRegistrationEvents();
    await _messaging.unregister();
  }

  Future<void> dispose() async {
    await _registrationSubscription?.cancel();
    await _unregistrationSubscription?.cancel();

    _registrationSubscription = null;
    _unregistrationSubscription = null;
  }
}
