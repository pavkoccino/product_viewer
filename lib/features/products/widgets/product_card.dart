import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:product_viewer/features/products/models/product_model.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';
import 'package:product_viewer/utils/logger.dart';
import 'package:transparent_image/transparent_image.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onCardTap;
  final Widget? bottomPart;
  const ProductCard({super.key, this.onCardTap, required this.product, this.bottomPart});

  @override
  Widget build(BuildContext context) {
    final log = getLogger(ProductCard);
    return GestureDetector(
      onTap: onCardTap,
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(context.paddingScheme.p4),
                child: FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  imageErrorBuilder: (_, __, ___) {
                    return Center(
                      child: Icon(
                        Icons.no_photography,
                        size: 48,
                        color: context.colorScheme.outline,
                      ),
                    );
                  },
                  image: CachedNetworkImageProvider(
                    product.image,
                    errorListener: (e) {
                      log.e('CachednetworkImage could not load picture, $e');
                    },
                    cacheManager: CacheManager(
                      Config(
                        'productViewerImgCache',
                        stalePeriod: const Duration(days: 14),
                        maxNrOfCacheObjects: 100,
                      ),
                    ),
                  ),
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
