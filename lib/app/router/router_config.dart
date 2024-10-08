import 'package:auto_route/auto_route.dart';
import 'package:product_viewer/app/router/router_config.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  /// Global routes
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: HomeRoute.page),
        AutoRoute(page: ProductDetailRoute.page),
      ];
}
