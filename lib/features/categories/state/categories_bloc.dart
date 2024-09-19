import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:product_viewer/core/bloc_generic/bloc_states.dart';
import 'package:product_viewer/features/categories/state/bloc.dart';
import 'package:product_viewer/features/products/repositories/product_repository.dart';
import 'package:product_viewer/utils/logger.dart';

class CategoriesBloc extends HydratedBloc<CategoriesEvent, CategoriesState> {
  final ProductRepository productRepository;

  final _log = getLogger(CategoriesBloc);
  CategoriesBloc({required this.productRepository}) : super(const BlocInitial<List<String>>()) {
    on<LoadCategoriesEvent>(_onLoadCategories);
  }

  Future<void> _onLoadCategories(
    LoadCategoriesEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    // To not emit Loading if we have some categories loaded from cache
    if (state is! BlocLoaded<List<String>>) {
      _log.d('Emitting loading state');
      emit(const BlocLoading<List<String>>());
    }

    try {
      final categories = await productRepository.getCategories();
      _log.i('${categories.length} categories loaded from BE');
      emit(BlocLoaded<List<String>>(categories));
    } catch (e) {
      _log.e(e);
      if (state is BlocLoaded<List<String>>) {
        _log.w('Cached data are used as a fallback');
      } else {
        emit(BlocError<List<String>>(e is Exception ? e : Exception(e.toString())));
      }
    }
  }

  @override
  CategoriesState? fromJson(Map<String, dynamic> json) {
    try {
      final categories = jsonDecode(json['categories']) as List<dynamic>?;
      if (categories != null && categories.isNotEmpty) {
        final categoriesTyped = categories.map((categoryJson) => categoryJson as String).toList();
        _log.i('CategoriesState cache loaded, ${categories.length} categories loaded');
        return BlocLoaded<List<String>>(categoriesTyped);
      }
    } catch (e) {
      _log.e('Failed to deserialize CategoriesState: $e');
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(CategoriesState state) {
    if (state is BlocLoaded<List<String>> && state.data.isNotEmpty) {
      final categoriesJsonified = jsonEncode(state.data);
      _log.i('Writing ${state.data.length} categories to cache');
      return {'categories': categoriesJsonified};
    }
    return null;
  }
}
