import 'package:flutter/material.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';

class NotConnected extends StatelessWidget {
  const NotConnected({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: context.screenWidth,
      child: Row(
        children: [
          Text(
            'Internet není k dispozici',
            style: context.textTheme.titleSmall,
          ),
          const Spacer(),
          SizedBox(
            width: 80,
            height: 12,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(context.borderRadiusScheme.r3),
              backgroundColor: context.customColorScheme.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
