import 'package:flutter/material.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';
import 'package:product_viewer/utils/extensions/list_widget.dart';

class LoadingFailed extends StatelessWidget {
  const LoadingFailed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.error_outline_outlined,
          color: context.colorScheme.error,
          size: 56,
        ),
        Text(
          'Při načítání došlo k chybě',
          style: context.textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ].withSpaceBetween(height: context.paddingScheme.p2),
    );
  }
}
