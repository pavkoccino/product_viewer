import 'package:flutter/material.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';

class BackgroundGradientWrapper extends StatelessWidget {
  final Widget child;
  final Widget gradient;
  final Widget? background;

  const BackgroundGradientWrapper({
    super.key,
    required this.child,
    required this.gradient,
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        gradient,
        if (background != null) background!,
        // Material needed as BackgroundGradient covers us InkWell
        // https://stackoverflow.com/questions/45424621/inkwell-not-showing-ripple-effect
        Material(
          color: context.customColorScheme.transparent,
          child: child,
        ),
      ],
    );
  }
}
