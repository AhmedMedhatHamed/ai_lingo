import 'package:ai_lingo/core/services/firestore_service.dart';
import 'package:ai_lingo/feature/auth/models/user_model.dart';

class UserRepository {
  final FirestoreService firestoreService;

  UserRepository(this.firestoreService);

  Future<void> createUser(UserModel user) async {
    await firestoreService.addUser(user);
  }

  Future<UserModel?> getUser(String uid) async {
    final document = await firestoreService.getUser(uid);

    if (document.exists && document.data() != null) {
      return UserModel.fromMap(document.data()!);
    }

    return null;
  }
}
