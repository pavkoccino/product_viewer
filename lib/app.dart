import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:product_viewer/app/router/router_config.dart';
import 'package:product_viewer/app/theme/app_theme.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';

class App extends StatelessWidget {
  App({super.key});

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().appThemeLight,
        routerConfig: _router.config(),
        builder: (context, widget) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              // iOS only
              statusBarBrightness: Brightness.light,
              // Android only
              systemNavigationBarIconBrightness: Brightness.dark, statusBarIconBrightness: Brightness.dark,
              statusBarColor: context.customColorScheme.transparent,
              systemNavigationBarColor: context.colorScheme.surface,
            ),
            child: widget ?? const Text('Něco se pokazilo'),
          );
        });
  }
}
