import 'package:get_it/get_it.dart';
import 'package:product_viewer/features/products/repositories/product_repository.dart';

final GetIt locator = GetIt.instance;

/// Singleton provider, typically used for repositories, sharedPreferences, generally for stuff
/// that should be created once and used across the app
void setupLocator() {
  locator.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl());
}
