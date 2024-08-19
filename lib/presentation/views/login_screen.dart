// lib/presentation/pages/sign_in_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopeasy/presentation/providers/auth_providers.dart';

class SignInPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign-In'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await ref.read(signOutProvider).call();
            },
          ),
        ],
      ),
      body: Center(
        child: user.when(
          data: (user) {
            if (user == null) {
              return ElevatedButton(
                onPressed: () async {
                  await ref.read(signInWithGoogleProvider).call();
                },
                child: Text('Sign in with Google'),
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('Signed in as ${user.email}'),
                  Text('Signed in as ${user.displayName}'),
                  ElevatedButton(
                    onPressed: () async {
                      await ref.read(signOutProvider).call();
                    },
                    child: Text('Sign out'),
                  ),
                ],
              );
            }
          },
          loading: () => CircularProgressIndicator(),
          error: (e, stack) => Text('Error: $e'),
        ),
      ),
    );
  }
}
