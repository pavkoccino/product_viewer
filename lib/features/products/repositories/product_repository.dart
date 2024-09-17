import 'package:product_viewer/core/controllers/base_controller.dart';
import 'package:product_viewer/features/products/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getAllProducts();
}

class ProductRepositoryImpl extends BaseController implements ProductRepository {
  final String path = '/products';

  ProductRepositoryImpl();

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await getJsonList(path);
    return response.map(ProductModel.fromJson).toList();
  }
}
