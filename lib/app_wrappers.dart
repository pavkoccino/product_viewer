import 'package:flutter/material.dart';
import 'package:product_viewer/widgets/connectivity/internet_connection_wrapper.dart';

class AppWrappers extends StatelessWidget {
  final Widget child;
  const AppWrappers({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InternetConnectionWrapper(child: child);
  }
}
