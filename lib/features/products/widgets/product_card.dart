import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:product_viewer/app/router/router_config.gr.dart';
import 'package:product_viewer/features/products/models/product_model.dart';
import 'package:product_viewer/features/products/widgets/product_card_bottom.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(ProductDetailRoute(product: product)),
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
            ProductCardBottom(product: product),
          ],
        ),
      ),
    );
  }
}
