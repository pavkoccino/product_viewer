import 'package:flutter/material.dart';

class SnackBarFactory {
  static SnackBar info({
    required Widget content,
    final Duration duration = const Duration(seconds: 4),
    final SnackBarBehavior behavior = SnackBarBehavior.floating,
  }) {
    return SnackBar(
      behavior: behavior,
      content: content,
      duration: duration,
    );
  }
}
