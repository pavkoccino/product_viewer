import 'package:flutter/material.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';

class MyLinearProgressIndicator extends StatelessWidget {
  const MyLinearProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth * 0.4,
      height: 8,
      child: LinearProgressIndicator(
        borderRadius: BorderRadius.circular(context.borderRadiusScheme.r1),
      ),
    );
  }
}
