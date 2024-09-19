import 'package:flutter/material.dart';

final textTheme = TextTheme(
  displayLarge: _font(size: 32, weight: FontWeight.w700),
  // Pin keyboard
  displayMedium: _font(size: 24, weight: FontWeight.w700),
  // Account name
  displaySmall: _font(size: 24, weight: FontWeight.w300),
  // Pin action
  //
  titleLarge: _font(size: 20, weight: FontWeight.w700),
  // Default AppBar style
  titleMedium: _font(size: 20, weight: FontWeight.w400),
  // Dialog title, Drawer title
  titleSmall: _font(size: 16, weight: FontWeight.w700),
  // AboutUs screen titles
  //
  headlineLarge: _font(size: 18, weight: FontWeight.w700),
  headlineMedium: _font(size: 18, weight: FontWeight.w500),
  // Dashboard section, Tile descriptions
  headlineSmall: _font(size: 18, weight: FontWeight.w400),
  // Gallery section
  //
  labelLarge: _font(size: 16, weight: FontWeight.w500),
  // Active tabs, Dashboard table labels
  labelMedium: _undefinedFont,
  // Form field name
  labelSmall: _font(size: 14, weight: FontWeight.w700),
  // Dashboard field status
  //
  bodyLarge: _font(size: 16, weight: FontWeight.w400),
  // Inactive tabs, Dashboard tabs
  bodyMedium: _font(size: 14, weight: FontWeight.w400),
  // Default Text style
  bodySmall: _font(size: 13, weight: FontWeight.w400), // Badge, AppointmentCard metadata
);

//ignore: unused_element
const TextStyle _undefinedFont = TextStyle(
  fontSize: 12,
  color: Colors.purple,
  fontWeight: FontWeight.w900,
  fontStyle: FontStyle.italic,
);

TextStyle _font({required double size, required FontWeight weight}) {
  return TextStyle(
    fontSize: size,
    fontWeight: weight,
    letterSpacing: -0.15,
    fontFamily: 'Roboto',
  );
}
