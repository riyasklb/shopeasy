// lib/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopeasy/features/home/presentaion/pages/home_page.dart';
import 'package:shopeasy/features/spash/presentation/pages/spash_page.dart';
import 'package:shopeasy/go_router_refreshstraeam.dart';
import 'features/authentication/presentation/pages/sign_in_page.dart';

import 'features/authentication/presentation/state/auth_state.dart';


final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/',
    refreshListenable: GoRouterRefreshStream(
      ref.watch(authProvider.notifier).stream,
    ),
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        path: '/sign-in',
        builder: (context, state) => SignInPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => HomePage(),
      ),
    ],
    redirect: (context, state) {
      final isSplash = state.matchedLocation == '/';
      final isAuthenticated = authState != null;

      if (isSplash) {
        return isAuthenticated ? '/home' : '/sign-in';
      }

      if (!isAuthenticated) {
        return '/sign-in';
      }

      return null;
    },
  );
});
