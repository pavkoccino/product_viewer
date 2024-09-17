import 'package:flutter/material.dart';

/// Paddings used in custom widgets
/// called as `context.paddingScheme`
class PaddingScheme extends ThemeExtension<PaddingScheme> {
  final double p1 = 4.0;
  final double p2 = 8.0;
  final double p3 = 16.0;
  final double p4 = 24.0;
  final double p5 = 32.0;

  @override
  ThemeExtension<PaddingScheme> copyWith() {
    return PaddingScheme();
  }

  @override
  ThemeExtension<PaddingScheme> lerp(covariant ThemeExtension<PaddingScheme>? other, double t) {
    if (other is! PaddingScheme) {
      return this;
    }
    return PaddingScheme();
  }
}
