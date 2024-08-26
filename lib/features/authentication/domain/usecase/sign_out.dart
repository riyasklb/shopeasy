// lib/features/authentication/domain/usecases/sign_out.dart
import 'package:shopeasy/features/authentication/domain/repository/auth_repository.dart';



class SignOut {
  final AuthRepository repository;

  SignOut(this.repository);

  Future<void> call() async {
    await repository.signOut();
  }
}
