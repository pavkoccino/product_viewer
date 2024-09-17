import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_viewer/features/products/widgets/products_list.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';
import 'package:product_viewer/widgets/scaffolds/basic_scaffold.dart';

import 'core/repo_locator/locator.dart';
import 'features/products/repositories/product_repository.dart';
import 'features/products/state/products_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      withGradient: true,
      horizontalPadding: true,
      title: Text('Nejnovější produkty', style: context.textTheme.displayLarge),
      centerTitle: false,
      body: BlocProvider(
        create: (context) => ProductBloc(productRepository: locator<ProductRepository>()),
        child: const ProductsList(),
      ),
    );
  }
}
