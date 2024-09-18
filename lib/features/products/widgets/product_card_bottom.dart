import 'package:flutter/material.dart';
import 'package:product_viewer/features/products/models/product_model.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';
import 'package:product_viewer/widgets/text/text_trailing_icon.dart';

class ProductCardBottom extends StatelessWidget {
  final ProductModel product;
  const ProductCardBottom({
    super.key,
    required this.product,
  });

  Widget _buildBottomDescription(BuildContext context, {required ProductModel product}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          product.title,
          maxLines: 2,
        ),
        _buildPriceRating(context, product: product),
      ],
    );
  }

  Widget _buildPriceRating(BuildContext context, {required ProductModel product}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          product.priceWithCurrency,
          style: context.textTheme.titleSmall,
        ),
        TextTrailingIcon(
            text: product.rating.rateString, icon: Icons.star, iconColor: context.colorScheme.inversePrimary),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.5 * 0.25,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
          context.paddingScheme.p3, context.paddingScheme.p2, context.paddingScheme.p3, context.paddingScheme.p3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(context.borderRadiusScheme.r5),
          bottomRight: Radius.circular(context.borderRadiusScheme.r5),
        ),
        border: Border.all(color: context.colorScheme.outline.withOpacity(0.7), width: 1),
        color: context.colorScheme.outline.withOpacity(0.4),
      ),
      child: _buildBottomDescription(context, product: product),
    );
  }
}
