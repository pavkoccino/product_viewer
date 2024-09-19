import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:product_viewer/core/bloc_generic/bloc_states.dart';
import 'package:product_viewer/features/products/models/product_model.dart';
import 'package:product_viewer/features/products/repositories/product_repository.dart';
import 'package:product_viewer/features/products/state/bloc.dart';
import 'package:product_viewer/utils/logger.dart';

class ProductBloc extends HydratedBloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  final _log = getLogger(ProductBloc);
  ProductBloc({required this.productRepository}) : super(const BlocInitial<List<ProductModel>>()) {
    on<LoadProductsEvent>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
    LoadProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    // To not emit Loading if we have some products loaded from cache
    if (state is! BlocLoaded<List<ProductModel>>) {
      _log.d('Emitting loading state');
      emit(const BlocLoading<List<ProductModel>>());
    }

    try {
      final products = await productRepository.getAllProducts();
      _log.i('${products.length} products loaded from BE');
      emit(BlocLoaded<List<ProductModel>>(products));
    } catch (e) {
      _log.e(e);
      if (state is BlocLoaded<List<ProductModel>>) {
        _log.w('Cached data are used as a fallback');
      } else {
        emit(BlocError<List<ProductModel>>(e is Exception ? e : Exception(e.toString())));
      }
    }
  }

  @override
  ProductState? fromJson(Map<String, dynamic> json) {
    try {
      final productsJson = json['products'] as List<dynamic>?;
      if (productsJson != null && productsJson.isNotEmpty) {
        final products =
            productsJson.map((productJson) => ProductModel.fromJson(productJson as Map<String, dynamic>)).toList();
        _log.i('Cache loaded, ${products.length} products loaded');
        return BlocLoaded<List<ProductModel>>(products);
      }
    } catch (e) {
      _log.e('Failed to deserialize ProductState: $e');
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(ProductState state) {
    if (state is BlocLoaded<List<ProductModel>> && state.data.isNotEmpty) {
      final productsJsonified = state.data.map((product) => product.toJson()).toList();
      _log.i('Writing ${productsJsonified.length} products to cache');
      return {'products': productsJsonified};
    }
    return null;
  }
}
