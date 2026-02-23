import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/constants/app_strings.dart';
import 'core/navigation/app_router.dart';
import 'core/navigation/navigation_service.dart';
import 'core/state/app_state.dart';
import 'core/theme/app_theme.dart';
import 'data/mock/mock_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateProvider(
      child: Builder(
        builder: (context) {
          _loadMockData(context);
          return MaterialApp(
            title: AppStrings.appTitle,
            theme: AppTheme.light,
            debugShowCheckedModeBanner: kDebugMode,
            navigatorKey: NavigationService.navigatorKey,
            initialRoute: '/',
            onGenerateRoute: AppRouter.generateRoute,
          );
        },
      ),
    );
  }

  void _loadMockData(BuildContext context) {
    final state = AppState.of(context);
    if (state.accounts.value.isEmpty) {
      state.loadMockData(
        accounts: MockAccounts.accounts,
        cards: MockCards.cards,
      );
    }
  }
}
