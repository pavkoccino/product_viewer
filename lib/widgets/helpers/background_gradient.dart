import 'package:flutter/material.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Define the radial gradient here
        // color: context.customColorScheme.transparent,
        gradient: RadialGradient(
          colors: [
            const Color(0xfffcecc2),
            context.colorScheme.surface, // Outer color
          ],
          center: const Alignment(0.5, -0.75), // Center point of the gradient
          radius: 0.55, // Radius of the gradient, 0.0 - 1.0
          focal: const Alignment(0.7, -0.9), // Focal point of the gradient
          focalRadius: 0.1,
          stops: const [0.0, 1.0], // Defines where the color transition happens
        ),
      ),
    );
  }
}
