// lib/features/authentication/domain/usecases/sign_in_with_google.dart
import 'package:shopeasy/features/authentication/domain/entities/user_entities.dart';
import 'package:shopeasy/features/authentication/domain/repository/auth_repository.dart';



class SignInWithGoogle {
  final AuthRepository repository;

  SignInWithGoogle(this.repository);

  Future<UserEntity?> call() async {
    return await repository.signInWithGoogle();
  }
}
