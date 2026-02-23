import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';

class StubScreen extends StatelessWidget {
  const StubScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('$title${AppStrings.toBeImplemented}')),
    );
  }
}
