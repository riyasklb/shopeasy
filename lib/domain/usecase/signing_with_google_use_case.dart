// lib/domain/usecase/sign_in_with_google_use_case.dart
import 'package:shopeasy/domain/repositories/auth_repositoru.dart';


class SignInWithGoogle {
  final AuthRepository _authRepository;

  SignInWithGoogle(this._authRepository);

  Future<void> call() async {
    await _authRepository.signInWithGoogle();
  }
}



class SignOut {
  final AuthRepository _authRepository;

  SignOut(this._authRepository);

  Future<void> call() async {
    await _authRepository.signOut();
  }
}
