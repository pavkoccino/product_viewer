import 'package:flutter/material.dart';
import 'package:product_viewer/widgets/scaffolds/basic_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasicScaffold(
      withGradient: true,
      body: Center(child: Text('Hello world!')),
    );
  }
}
