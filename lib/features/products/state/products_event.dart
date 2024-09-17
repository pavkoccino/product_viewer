import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class LoadProductsEvent extends ProductEvent {
  const LoadProductsEvent();

  @override
  List<Object> get props => [];
}
