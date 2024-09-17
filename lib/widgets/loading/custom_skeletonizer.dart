import 'package:flutter/material.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeletonizer extends StatelessWidget {
  final Widget child;

  const CustomSkeletonizer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: context.colorScheme.outline,
        highlightColor: context.colorScheme.onInverseSurface.withOpacity(0.20),
      ),
      child: child,
    );
  }
}
