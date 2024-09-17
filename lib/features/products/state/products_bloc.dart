import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:product_viewer/features/products/repositories/product_repository.dart';
import 'package:product_viewer/features/products/state/bloc.dart';
import 'package:product_viewer/utils/logger.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  final _log = getLogger(ProductBloc);

  ProductBloc({required this.productRepository}) : super(const ProductsInitial()) {
    on<LoadProductsEvent>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
    LoadProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(const ProductsLoading());
    try {
      final products = await productRepository.getAllProducts();
      emit(ProductsLoaded(products));
    } on DioException catch (e) {
      _log.e(e);
      emit(ProductsError(e));
    }
  }
}
