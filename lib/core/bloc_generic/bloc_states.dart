import 'package:equatable/equatable.dart';

/// A base class representing various states for a Bloc using a generic type [T].
///
/// The `BlocState` class and its subclasses are used to manage the different
/// possible states of a Bloc, making it easy to handle the flow of data and errors
/// within the application. Each state extends `Equatable` to support value comparisons,
/// which helps with efficient state updates.
///
/// Subclasses:
/// - **BlocInitial**: Represents the initial state of the Bloc before any action is taken.
/// - **BlocLoading**: Represents a loading state, often used when data is being fetched or processed.
/// - **BlocLoaded**: Represents a successful state where data of type [T] has been loaded.
/// - **BlocError**: Represents an error state with an associated exception.
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
