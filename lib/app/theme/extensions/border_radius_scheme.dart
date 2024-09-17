import 'package:flutter/material.dart';

/// Border radius used in custom widgets
/// called as `context.borderRadiusScheme`
class BorderRadiusScheme extends ThemeExtension<BorderRadiusScheme> {
  double get factor => 1;
  double get r1 => 4 * factor;
  double get r2 => 8 * factor;
  double get r3 => 12 * factor;
  double get r4 => 16 * factor;
  double get r5 => 24 * factor;
  double get r6 => 48 * factor;

  BorderRadius get borderRadius1 => BorderRadius.circular(r1);
  BorderRadius get borderRadius2 => BorderRadius.circular(r2);
  BorderRadius get borderRadius3 => BorderRadius.circular(r3);
  BorderRadius get borderRadius4 => BorderRadius.circular(r4);
  BorderRadius get borderRadius5 => BorderRadius.circular(r5);
  BorderRadius get borderRadius6 => BorderRadius.circular(r6);

  BorderRadius get bottomBorderRadiusLarge => BorderRadius.vertical(
        bottom: Radius.circular(r5),
      );

  @override
  ThemeExtension<BorderRadiusScheme> copyWith() {
    return BorderRadiusScheme();
  }

  @override
  ThemeExtension<BorderRadiusScheme> lerp(covariant ThemeExtension<BorderRadiusScheme>? other, double t) {
    if (other is! BorderRadiusScheme) {
      return this;
    }
    return BorderRadiusScheme();
  }
}
