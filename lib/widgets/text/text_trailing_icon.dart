import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';

class TextTrailingIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  const TextTrailingIcon({
    super.key,
    required this.text,
    required this.icon,
    required this.iconColor,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: context.textTheme.titleSmall,
        ),
        Gap(context.paddingScheme.p1),
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        )
      ],
    );
  }
}
