// lib/features/authentication/data/repositories/auth_repository_impl.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopeasy/features/authentication/domain/entities/user_entities.dart';
import 'package:shopeasy/features/authentication/domain/repository/auth_repository.dart';


class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRepositoryImpl(this._firebaseAuth, this._googleSignIn);

  @override
  Future<UserEntity?> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      final user = userCredential.user;
      return user != null
          ? UserEntity(
              uid: user.uid,
              displayName: user.displayName ?? '',
              email: user.email ?? '',
              photoURL: user.photoURL ?? '',
            )
          : null;
    } catch (e) {
      print('Google Sign-In failed: $e');
      return null;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }
}
