import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:test_project/core/theme/app_theme.dart';
import 'package:test_project/data/models/card_model.dart';
import 'package:test_project/presentation/screens/card_details_screen.dart';
import 'package:test_project/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: kDebugMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/card-details': (context) {
          final args = ModalRoute.of(context)?.settings.arguments;
          return CardDetailsScreen(card: args is CardModel ? args : null);
        },
      },
    );
  }
}
