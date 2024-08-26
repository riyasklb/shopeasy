// lib/features/authentication/domain/entities/user_entity.dart
class UserEntity {
  final String uid;
  final String displayName;
  final String email;
  final String photoURL;

  UserEntity({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.photoURL,
  });
}
