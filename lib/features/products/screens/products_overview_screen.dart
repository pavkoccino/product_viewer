import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_viewer/core/repo_locator/locator.dart';
import 'package:product_viewer/features/products/repositories/product_repository.dart';
import 'package:product_viewer/features/products/state/products_bloc.dart';
import 'package:product_viewer/features/products/state/products_event.dart';
import 'package:product_viewer/features/products/widgets/products_list.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';
import 'package:product_viewer/widgets/scaffolds/basic_scaffold.dart';

@RoutePage()
class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      withGradient: true,
      horizontalPadding: true,
      title: Text('Nejnovější produkty', style: context.textTheme.displayLarge),
      centerTitle: false,
      body: BlocProvider(
        create: (context) => ProductBloc(productRepository: locator<ProductRepository>()),
        child: Builder(builder: (context) {
          return RefreshIndicator(
              onRefresh: () async {
                final productBloc = BlocProvider.of<ProductBloc>(context);
                productBloc.add(const LoadProductsEvent());
              },
              child: ListView(physics: const BouncingScrollPhysics(), children: const [ProductsList()]));
        }),
      ),
    );
  }
}
