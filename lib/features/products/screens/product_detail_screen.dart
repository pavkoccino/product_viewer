import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:product_viewer/features/products/models/product_model.dart';
import 'package:product_viewer/widgets/scaffolds/basic_scaffold.dart';

@RoutePage()
class ProductDetailScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(title: Text(product.title), body: const Placeholder());
  }
}
