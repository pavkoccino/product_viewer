import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:product_viewer/app/theme/app_theme.dart';
import 'package:product_viewer/utils/extensions/build_context.dart';

class App extends StatelessWidget {
  final Widget root;
  const App({super.key, required this.root});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().appThemeLight,
        builder: (context, _) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              // iOS only
              statusBarBrightness: Brightness.light,
              // Android only
              systemNavigationBarIconBrightness: Brightness.dark, statusBarIconBrightness: Brightness.dark,
              statusBarColor: context.customColorScheme.transparent,
              systemNavigationBarColor: context.colorScheme.surface,
            ),
            child: root,
          );
        });
  }
}
