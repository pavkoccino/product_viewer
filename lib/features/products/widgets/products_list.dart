import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:product_viewer/core/constants.dart';
import 'package:product_viewer/core/repo_locator/locator.dart';
import 'package:product_viewer/features/products/models/product_model.dart';
import 'package:product_viewer/features/products/repositories/product_repository.dart';
import 'package:product_viewer/features/products/state/bloc.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';
import 'package:product_viewer/widgets/loading/my_bloc_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:transparent_image/transparent_image.dart';

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
                        Container(
                          height: context.screenHeight * 0.5 * 0.25,
                          padding: EdgeInsets.fromLTRB(context.paddingScheme.p3, context.paddingScheme.p2,
                              context.paddingScheme.p3, context.paddingScheme.p3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(context.borderRadiusScheme.r5),
                              bottomRight: Radius.circular(context.borderRadiusScheme.r5),
                            ),
                            border: Border.all(color: context.colorScheme.outline.withOpacity(0.7), width: 1),
                            color: context.colorScheme.outline.withOpacity(0.4),
                          ),
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                product.title,
                                maxLines: 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    product.priceWithCurrency,
                                    style: context.textTheme.titleSmall,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        product.rating.rateString,
                                        style: context.textTheme.titleSmall,
                                      ),
                                      Gap(context.paddingScheme.p1),
                                      Icon(
                                        Icons.star,
                                        color: context.colorScheme.inversePrimary,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
