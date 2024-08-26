// lib/features/authentication/domain/repositories/auth_repository.dart
import 'package:shopeasy/features/authentication/domain/entities/user_entities.dart';

abstract class AuthRepository {
  Future<UserEntity?> signInWithGoogle();
  Future<void> signOut();
}
