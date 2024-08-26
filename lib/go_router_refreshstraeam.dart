// lib/go_router_refresh_stream.dart
import 'dart:async';
import 'package:flutter/material.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  final Stream<dynamic> _stream;
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(this._stream) {
    _subscription = _stream.asBroadcastStream().listen((_) {
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
