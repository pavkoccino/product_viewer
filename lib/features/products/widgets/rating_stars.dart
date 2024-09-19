import 'package:flutter/material.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final int maxStars;
  final double starSize;

  const RatingStars({
    super.key,
    required this.rating,
    this.maxStars = 5,
    this.starSize = 24.0,
  });

  Widget _buildIcon(
    BuildContext context, {
    required iconData,
  }) {
    return Icon(
      iconData,
      size: starSize,
      color: context.colorScheme.inversePrimary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(maxStars, (index) {
        double starRating = rating - index;

        if (starRating >= 1) {
          return _buildIcon(context, iconData: Icons.star);
        } else if (starRating >= 0.5) {
          return _buildIcon(context, iconData: Icons.star_half);
        } else {
          return _buildIcon(context, iconData: Icons.star_border);
        }
      }),
    );
  }
}
