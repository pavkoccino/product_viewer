import 'package:flutter/material.dart';

const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  // Primary
  primary: Color(0xFFF3A423), // Warm amber
  onPrimary: Color(0xFF000000), // Black text on primary
  primaryContainer: Color(0xFFFFECB3), // Light amber
  onPrimaryContainer: Color(0xFF663C00), // Dark brown text on container

  // Secondary
  secondary: Color(0xFFFACC87), // Light orange
  onSecondary: Color(0xFF000000), // Black text on secondary
  secondaryContainer: Color(0xFFFFE0B2), // Very light orange
  onSecondaryContainer: Color(0xFF664500), // Dark orange-brown text on container

  // Error
  error: Color(0xFFF52E5C), // Light coral
  onError: Color(0xFF000000), // Black text on error
  errorContainer: Color(0xFFFFE0B2), // Very light orange (same as secondaryContainer)
  onErrorContainer: Color(0xFF662500), // Dark red-brown text on container

  // Surface and Background
  surface: Color(0xFFFFFFFF), // Very light yellow surface
  onSurface: Color(0xFF33302E), // Dark gray-brown text

  // Inverse
  inverseSurface: Color(0xFF3E2723), // Dark brown inverse surface
  onInverseSurface: Color(0xFFFFF8E1), // Light yellow text on inverse surface
  inversePrimary: Color(0xFFFFD54F), // Lighter amber for inverse primary

  // Other
  outline: Color(0xFFD6C8B1), // Light beige outline
  shadow: Color(0x55000000), // Semi-transparent black shadows
  surfaceTint: Color(0xFFFFA000), // Tint with primary color
);
