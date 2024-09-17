import 'package:flutter/material.dart';
import 'package:product_viewer/app/theme/extensions/border_radius_scheme.dart';
import 'package:product_viewer/app/theme/extensions/custom_color_scheme.dart';
import 'package:product_viewer/app/theme/extensions/padding_scheme.dart';

extension BuildContextExt on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;

  // Material theme
  ColorScheme get colorScheme => _theme.colorScheme;
  TextTheme get textTheme => _theme.textTheme;
  ThemeData get _theme => Theme.of(this);

  // Theme extensions
  CustomColorScheme get customColorScheme => _theme.extension<CustomColorScheme>()!;
  BorderRadiusScheme get borderRadiusScheme => _theme.extension<BorderRadiusScheme>()!;
  PaddingScheme get paddingScheme => _theme.extension<PaddingScheme>()!;
}
