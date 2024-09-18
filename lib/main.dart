import 'package:flutter/material.dart';
import 'package:product_viewer/app.dart';

import 'core/repo_locator/locator.dart';

void main() {
  setupLocator();
  runApp(App());
}
