import 'package:flutter/material.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';

class CircleGradientContainer extends StatelessWidget {
  final Widget child;

  const CircleGradientContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: context.colorScheme.inversePrimary.withOpacity(0.65),
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.colorScheme.primary.withOpacity(0.45),
                context.colorScheme.inversePrimary.withOpacity(0.25),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
