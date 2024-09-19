import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_viewer/core/bloc_generic/bloc_states.dart';
import 'package:product_viewer/widgets/loading/custom_skeletonizer.dart';
import 'package:product_viewer/widgets/loading/my_linear_progress_indicator.dart';
import 'package:product_viewer/widgets/warnings/loading_failed.dart';

/// A custom BlocBuilder widget that handles various bloc states (loading, error, loaded)
/// and provides specific UI elements based on the state:
/// - Shows a custom skeleton loader when data is loading, using optional mock data if provided.
/// - Displays a progress indicator if no mock data is available during loading.
/// - Shows an error widget when the state is an error.
/// - Renders the provided builder function when the state has loaded successfully.
class MyBlocBuilder<B extends BlocBase<S>, S extends BlocState<T>, T> extends StatelessWidget {
  final Widget Function(BuildContext context, T data) builder;
  final T? mockDataToSkeletonize;

  const MyBlocBuilder({
    super.key,
    required this.builder,
    this.mockDataToSkeletonize,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, S>(
      builder: (context, state) {
        if (state is BlocLoading<T>) {
          return mockDataToSkeletonize != null
              ? CustomSkeletonizer(
                  child: builder(context, mockDataToSkeletonize as T),
                )
              : const Center(child: MyLinearProgressIndicator());
        } else if (state is BlocError<T>) {
          return const Center(child: LoadingFailed());
        } else if (state is BlocLoaded<T>) {
          return builder(context, state.data);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
