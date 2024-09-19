import 'package:equatable/equatable.dart';

abstract class CategoriesEvent extends Equatable {
  const CategoriesEvent();
}

class LoadCategoriesEvent extends CategoriesEvent {
  const LoadCategoriesEvent();

  @override
  List<Object> get props => [];
}
