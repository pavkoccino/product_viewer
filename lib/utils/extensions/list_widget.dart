import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

extension ListSpaceBetweenExtension on List<Widget> {
  List<Widget> withSpaceBetween({double height = 16, bool addDivider = false}) => [
        if (isNotEmpty) this[0],
        for (int i = 1; i < length; i++) ...[
          Gap(addDivider ? height / 2 : height),
          if (addDivider)
            Column(
              children: [
                const Divider(
                  thickness: 2,
                ),
                Gap(height / 2),
              ],
            ),
          this[i],
        ],
      ];
}
