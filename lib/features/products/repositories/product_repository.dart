import 'package:product_viewer/core/controllers/base_controller.dart';
import 'package:product_viewer/features/products/models/product_model.dart';
import 'package:product_viewer/features/products/models/rating_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getAllProducts();
  List<ProductModel> mockProducts(int count);
}

class ProductRepositoryImpl extends BaseController implements ProductRepository {
  final String path = '/products';

  ProductRepositoryImpl();

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await getJsonList(path);
    return response.map(ProductModel.fromJson).toList();
  }

  @override
  List<ProductModel> mockProducts(int count) {
    return List.generate(
      count,
      (index) => ProductModel(
        id: index + 1,
        title: 'Product Title Lorem Ipsum ${index + 1}',
        price: (index + 1) * 10.0,
        description: 'Description for product ${index + 1}',
        category: 'Category ${index % 5 + 1}',
        image: 'https://via.placeholder.com/150',
        rating: RatingModel(
          rate: 3.5 + (index % 5) * 0.5,
          count: (index + 1) * 10,
        ),
      ),
    );
  }
}
