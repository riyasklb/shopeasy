import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shopeasy/domain/entities/users.dart';
import 'package:shopeasy/domain/repositories/auth_repositoru.dart';



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
              email: user.email,
              displayName: user.displayName,
            )
          : null;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await _googleSignIn.signOut();
  }

  @override
  Stream<UserEntity?> get user {
    return _firebaseAuth.authStateChanges().map((user) => user != null
        ? UserEntity(
            uid: user.uid,
            email: user.email,
            displayName: user.displayName,
          )
        : null);
  }
}
