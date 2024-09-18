import 'package:flutter/material.dart';
import 'package:product_viewer/features/products/models/product_model.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onCardTap;
  final Widget? bottomPart;
  const ProductCard({super.key, this.onCardTap, required this.product, this.bottomPart});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(context.paddingScheme.p4),
                child: FadeInImage(
                  image: NetworkImage(product.image),
                  placeholder: MemoryImage(kTransparentImage),
                ),
              ),
            ),
            if (bottomPart != null) bottomPart!
          ],
        ),
      ),
    );
  }
}
