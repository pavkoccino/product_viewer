import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_viewer/core/repo_locator/locator.dart';
import 'package:product_viewer/features/categories/state/bloc.dart';
import 'package:product_viewer/features/products/repositories/product_repository.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';
import 'package:product_viewer/utils/extensions/string.dart';
import 'package:product_viewer/widgets/containers/circle_gradient_container.dart';
import 'package:product_viewer/widgets/loading/my_bloc_builder.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesGrid extends StatefulWidget {
  const CategoriesGrid({super.key});

  @override
  State<CategoriesGrid> createState() => _CategoriesGridState();
}

class _CategoriesGridState extends State<CategoriesGrid> {
  late final CategoriesBloc _categoriesBloc;

  @override
  void initState() {
    super.initState();
    _categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    _categoriesBloc.add(const LoadCategoriesEvent());
  }

  @override
  void dispose() {
    _categoriesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categoriesCircleSize = context.screenWidth * 0.4;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Kategorie', style: context.textTheme.displayMedium),
        MyBlocBuilder<CategoriesBloc, CategoriesState, List<String>>(
          mockDataToSkeletonize: locator<ProductRepository>().mockCategories(5),
          builder: (context, categories) {
            return Center(
              child: Wrap(
                spacing: context.paddingScheme.p3,
                runSpacing: context.paddingScheme.p3,
                children: categories.map(
                  (category) {
                    return Skeleton.replace(
                      replacement: Bone.circle(
                        size: categoriesCircleSize,
                      ),
                      child: SizedBox.square(
                        dimension: categoriesCircleSize,
                        child: CircleGradientContainer(
                          child: Center(
                            child: Text(
                              category.capitalizeFirstLetter(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          },
        ),
      ],
    );
  }
}
