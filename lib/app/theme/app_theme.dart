import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:product_viewer/app/theme/extensions/border_radius_scheme.dart';
import 'package:product_viewer/app/theme/extensions/custom_color_scheme.dart';
import 'package:product_viewer/app/theme/extensions/padding_scheme.dart';
import 'package:product_viewer/app/theme/light_color_scheme.dart';
import 'package:product_viewer/app/theme/text_theme.dart';

class AppTheme {
  ThemeData get _lightBase => _base(Brightness.light);
  ThemeData get appThemeLight => _applyCommonSettings(_lightBase).copyWith();

  ThemeData _applyCommonSettings(ThemeData theme) {
    final customColorScheme = theme.extension<CustomColorScheme>()!;
    return theme.copyWith(
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        titleTextStyle: theme.textTheme.titleLarge,
        // backgroundColor: customColorScheme.transparent,
        surfaceTintColor: customColorScheme.transparent,
        color: customColorScheme.transparent,
        elevation: 10,
      ),
      dividerTheme: const DividerThemeData(
        space: 0,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(theme.colorScheme.onPrimary),
        trackColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return theme.colorScheme.primary;
          }
          return theme.colorScheme.outlineVariant;
        }),
      ),
      radioTheme: const RadioThemeData(
        visualDensity: VisualDensity.compact,
      ),
      searchBarTheme: SearchBarThemeData(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        hintStyle: WidgetStatePropertyAll(
          textTheme.bodyLarge?.copyWith(color: theme.colorScheme.outline),
        ),
        textStyle: WidgetStatePropertyAll(
          textTheme.bodyLarge,
        ),
        elevation: const WidgetStatePropertyAll(0),
      ),
      checkboxTheme: CheckboxThemeData(
        side: BorderSide(color: theme.colorScheme.outline),
      ),
      cardTheme: CardTheme(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
        //elevation: 24, custom shadow needed to be added
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: theme.colorScheme.primary,
        unselectedIconTheme: theme.iconTheme.copyWith(
          color: theme.colorScheme.outline,
          size: 24,
          weight: 500,
        ),
        selectedIconTheme: theme.iconTheme.copyWith(
          size: 24,
          color: theme.colorScheme.primary,
          fill: 1.0,
          weight: 500,
        ),
        selectedLabelStyle: theme.textTheme.bodyMedium,
        unselectedLabelStyle: theme.textTheme.bodyMedium,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          foregroundColor: theme.colorScheme.onPrimary,
          backgroundColor: theme.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        shape: const CircleBorder(),
        sizeConstraints: const BoxConstraints(minWidth: 60, minHeight: 60),
        iconSize: 40,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          foregroundColor: theme.colorScheme.onPrimary,
          backgroundColor: theme.colorScheme.primary,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        contentTextStyle: textTheme.labelLarge,
        backgroundColor: theme.colorScheme.outline,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: textTheme.labelLarge?.copyWith(
          // For some reason scales down the font size so we adjust it manually
          fontSize: textTheme.bodyLarge!.fontSize! + 5,
          color: theme.colorScheme.outline,
        ),
        floatingLabelStyle: textTheme.labelLarge?.copyWith(
          // For some reason scales down the font size so we adjust it manually
          fontSize: textTheme.bodyMedium!.fontSize! + 5,
          color: theme.colorScheme.outline,
        ),
        hintStyle: textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.outline,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: theme.colorScheme.outlineVariant,
          ),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: theme.colorScheme.onPrimaryContainer,
      ),
      tabBarTheme: TabBarTheme(
        dividerHeight: 0,
        labelStyle: theme.textTheme.titleSmall,
        unselectedLabelStyle: theme.textTheme.bodyLarge,
        overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
          // Use the default focused overlay color
          return states.contains(WidgetState.focused) ? null : Colors.transparent;
        }),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: theme.colorScheme.outline),
          ),
        ),
      ),
    );
  }

  ThemeData _base(Brightness brightness) {
    return ThemeData(
      useMaterial3: true,
      textTheme: textTheme,
      colorScheme: lightColorScheme,
      extensions: [
        CustomColorScheme(),
        BorderRadiusScheme(),
        PaddingScheme(),
      ],
    );
  }
}
