import 'package:bloc/bloc.dart';
import 'package:product_viewer/core/bloc_generic/bloc_states.dart';
import 'package:product_viewer/features/products/models/product_model.dart';
import 'package:product_viewer/features/products/repositories/product_repository.dart';
import 'package:product_viewer/features/products/state/bloc.dart';
import 'package:product_viewer/utils/logger.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  final _log = getLogger(ProductBloc);
  ProductBloc({required this.productRepository}) : super(const BlocInitial<List<ProductModel>>()) {
    on<LoadProductsEvent>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
    LoadProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(const BlocLoading<List<ProductModel>>());
    try {
      // Replace with your data fetching logic
      final products = await productRepository.getAllProducts();
      emit(BlocLoaded<List<ProductModel>>(products));
    } catch (e) {
      _log.e(e);
      emit(BlocError<List<ProductModel>>(e is Exception ? e : Exception(e.toString())));
    }
  }
}
