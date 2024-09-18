import 'package:flutter/material.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';

class ConnectionRegained extends StatelessWidget {
  const ConnectionRegained({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: context.screenWidth,
      child: Row(
        children: [
          Text(
            'Připojení obnoveno',
            style: context.textTheme.titleSmall,
          ),
          const Spacer(),
          Icon(Icons.check_circle, color: context.customColorScheme.success),
        ],
      ),
    );
  }
}
