// lib/features/authentication/presentation/pages/sign_in_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/auth_state.dart';

class SignInPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign-In Example'),
      ),
      body: Center(
        child: user == null
            ? ElevatedButton(
                onPressed: () => ref.read(authProvider.notifier).signIn(),
                child: Text('Sign in with Google'),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Signed in as ${user.displayName}'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => ref.read(authProvider.notifier).signOutUser(),
                    child: Text('Sign out'),
                  ),
                ],
              ),
      ),
    );
  }
}
