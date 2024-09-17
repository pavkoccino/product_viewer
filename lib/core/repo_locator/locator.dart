import 'package:get_it/get_it.dart';
import 'package:product_viewer/features/products/repositories/product_repository.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl());
}
