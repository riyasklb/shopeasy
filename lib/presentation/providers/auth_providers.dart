// lib/presentation/providers/auth_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopeasy/domain/entities/users.dart';
import 'package:shopeasy/domain/repositories/auth_repositoru.dart';

import 'package:shopeasy/domain/usecase/signing_with_google_use_case.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final signInWithGoogleProvider = Provider((ref) => SignInWithGoogle(ref.watch(authRepositoryProvider)));
final signOutProvider = Provider((ref) => SignOut(ref.watch(authRepositoryProvider)));
final userProvider = StreamProvider<UserEntity?>((ref) => ref.watch(authRepositoryProvider).user);
