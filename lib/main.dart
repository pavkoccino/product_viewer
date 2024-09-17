import 'package:flutter/material.dart';
import 'package:product_viewer/app.dart';
import 'package:product_viewer/home_screen.dart';

import 'core/repo_locator/locator.dart';

void main() {
  setupLocator();
  runApp(const App(
    root: HomeScreen(),
  ));
}
