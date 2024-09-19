import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:product_viewer/features/products/models/product_model.dart';
import 'package:product_viewer/features/products/widgets/product_card.dart';
import 'package:product_viewer/features/products/widgets/rating_stars.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';
import 'package:product_viewer/utils/extensions/list_widget.dart';
import 'package:product_viewer/utils/extensions/string.dart';
import 'package:product_viewer/widgets/scaffolds/basic_scaffold.dart';

@RoutePage()
class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailScreen({super.key, required this.product});

  Widget _buildProductDescription(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text('Popis produktu:', style: context.textTheme.labelLarge), Text(product.description)],
    );
  }

  Widget _buildProductRating(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingStars(rating: product.rating.rate),
        Text(
          'Hodnoceno ${product.rating.countString}x',
          style: context.textTheme.bodyMedium!
              .copyWith(color: context.colorScheme.onSurface.withOpacity(0.6), fontStyle: FontStyle.italic),
        )
      ],
    );
  }

  Widget _buildProductCard(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.5,
      child: Stack(
        children: [
          ProductCard(product: product),
          Positioned(
            top: context.paddingScheme.p3,
            right: context.paddingScheme.p3,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: context.paddingScheme.p3, vertical: context.paddingScheme.p2),
              decoration: BoxDecoration(
                color: context.colorScheme.secondary,
                borderRadius: BorderRadius.circular(context.borderRadiusScheme.r5),
              ),
              child: Text(
                product.priceWithCurrency,
                style: context.textTheme.displayLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductTitle(BuildContext context) {
    return Text(
      product.title,
      style: context.textTheme.displayMedium,
    );
  }

  Widget _buildCategory(BuildContext context) {
    return Row(
      children: [
        Text(
          'Kategorie: ',
          style: context.textTheme.labelLarge,
        ),
        Text(product.category.capitalizeFirstLetter()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      horizontalPadding: true,
      title: const Text('Detail produktu'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildCategory(context),
            _buildProductCard(context),
            _buildProductTitle(context),
            _buildProductRating(context),
            _buildProductDescription(context),
          ].withSpaceBetween(),
        ),
      ),
    );
  }
}
