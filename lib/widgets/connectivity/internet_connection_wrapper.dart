import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:product_viewer/utils/factories/snacks/snack_bar_factory.dart';
import 'package:product_viewer/widgets/connectivity/connection_regained.dart';
import 'package:product_viewer/widgets/connectivity/not_connected.dart';

class InternetConnectionWrapper extends StatefulWidget {
  final Widget child;
  const InternetConnectionWrapper({
    super.key,
    required this.child,
  });

  @override
  State<InternetConnectionWrapper> createState() => _InternetConnectionWrapperState();
}

class _InternetConnectionWrapperState extends State<InternetConnectionWrapper> {
  late final StreamSubscription<List<ConnectivityResult>> subscription;
  @override
  initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) => _handleConnectivityChange(result));
  }

  void _handleConnectivityChange(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.none)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBarFactory.info(duration: const Duration(days: 365), content: const NotConnected()));
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBarFactory.info(content: const ConnectionRegained()));
    }
  }

  @override
  dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
