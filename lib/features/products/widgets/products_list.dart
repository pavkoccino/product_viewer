import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_viewer/core/repo_locator/locator.dart';
import 'package:product_viewer/features/products/models/product_model.dart';
import 'package:product_viewer/features/products/repositories/product_repository.dart';
import 'package:product_viewer/features/products/state/bloc.dart';
import 'package:product_viewer/widgets/loading/my_bloc_builder.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  late final ProductBloc _productBloc;

  @override
  void initState() {
    super.initState();
    _productBloc = BlocProvider.of<ProductBloc>(context);
    _productBloc.add(const LoadProductsEvent());
  }

  @override
  void dispose() {
    _productBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyBlocBuilder<ProductBloc, ProductState, List<ProductModel>>(
      mockDataToSkeletonize: locator<ProductRepository>().mockProducts(20),
      builder: (context, products) {
        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return ListTile(
              dense: true,
              title: Text(product.title),
              trailing: Text('\$${product.price.toStringAsFixed(2)}'),
            );
          },
        );
      },
    );
  }
}
