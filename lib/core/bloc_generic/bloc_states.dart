import 'package:equatable/equatable.dart';

abstract class BlocState<T> extends Equatable {
  const BlocState();
}

class BlocInitial<T> extends BlocState<T> {
  const BlocInitial();

  @override
  List<Object?> get props => [];
}

class BlocLoading<T> extends BlocState<T> {
  const BlocLoading();

  @override
  List<Object?> get props => [];
}

class BlocLoaded<T> extends BlocState<T> {
  final T data;

  const BlocLoaded(this.data);

  @override
  List<Object?> get props => (T is List) ? data as List : [data];
}

class BlocError<T> extends BlocState<T> {
  final Exception exception;

  const BlocError(this.exception);

  @override
  List<Object?> get props => [exception];
}
