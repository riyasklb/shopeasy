// lib/domain/entities/user_entity.dart
import 'package:firebase_auth/firebase_auth.dart';

class UserEntity {
  final String uid;
  final String? displayName;
  final String? email;

  UserEntity({
    required this.uid,
    this.displayName,
    this.email,
  });

  // Factory constructor to create a UserEntity from a FirebaseUser
  factory UserEntity.fromFirebaseUser(User user) {
    return UserEntity(
      uid: user.uid,
      displayName: user.displayName,
      email: user.email,
    );
  }
}
