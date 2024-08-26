// lib/features/authentication/presentation/state/auth_state.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopeasy/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:shopeasy/features/authentication/domain/entities/user_entities.dart';
import 'package:shopeasy/features/authentication/domain/usecase/sign_in_with_google.dart';
import 'package:shopeasy/features/authentication/domain/usecase/sign_out.dart';


class AuthState extends StateNotifier<UserEntity?> {
  final SignInWithGoogle signInWithGoogle;
  final SignOut signOut;

  AuthState({required this.signInWithGoogle, required this.signOut}) : super(null);

  Future<void> checkAuthStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      state = UserEntity(
        uid: user.uid,
        displayName: user.displayName ?? '',
        email: user.email ?? '',
        photoURL: user.photoURL ?? '',
      );
    }
  }

  Future<void> signIn() async {
    final user = await signInWithGoogle();
    state = user;
  }

  Future<void> signOutUser() async {
    await signOut();
    state = null;
  }
}

final authProvider = StateNotifierProvider<AuthState, UserEntity?>((ref) {
  final firebaseAuth = FirebaseAuth.instance;
  final googleSignIn = GoogleSignIn();
  final authRepository = AuthRepositoryImpl(firebaseAuth, googleSignIn);

  final signInWithGoogle = SignInWithGoogle(authRepository);
  final signOut = SignOut(authRepository);

  return AuthState(signInWithGoogle: signInWithGoogle, signOut: signOut);
});
