import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:product_viewer/app.dart';

import 'core/repo_locator/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize caching
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  setupLocator(); // Initialize GetIt singletons
  runApp(App());
}
