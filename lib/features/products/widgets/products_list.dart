import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:product_viewer/app/router/router_config.gr.dart';
import 'package:product_viewer/core/constants.dart';
import 'package:product_viewer/core/repo_locator/locator.dart';
import 'package:product_viewer/features/products/models/product_model.dart';
import 'package:product_viewer/features/products/repositories/product_repository.dart';
import 'package:product_viewer/features/products/state/bloc.dart';
import 'package:product_viewer/features/products/widgets/product_card.dart';
import 'package:product_viewer/features/products/widgets/product_card_bottom.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';
import 'package:product_viewer/widgets/loading/my_bloc_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
        return SizedBox(
          height: context.screenHeight * 0.5,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return SizedBox(
                width: context.screenWidth * 0.5,
                child: Skeleton.replace(
                  replacement: ClipRRect(
                    borderRadius: BorderRadius.circular(context.borderRadiusScheme.r5),
                    child: Image.asset(
                      Constants.imgPlaceholderSkeletonizePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ProductCard(
                    product: product,
                    onCardTap: () => context.router.push(ProductDetailRoute(product: product)),
                    bottomPart: ProductCardBottom(product: product),
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => Gap(context.paddingScheme.p4),
          ),
        );
      },
    );
  }
}
