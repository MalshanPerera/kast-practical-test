import 'package:flutter/material.dart';

import 'app_routes.dart';
import '../../data/models/card_model.dart';
import '../../presentation/screens/add_card/add_card_screen.dart';
import '../../presentation/screens/card_details/card_details_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/messages/messages_screen.dart';
import '../../presentation/screens/notifications/notifications_screen.dart';
import '../../presentation/screens/profile/profile_screen.dart';
import '../../presentation/screens/settings/settings_screen.dart';
import '../../presentation/screens/stub_screen.dart';
import '../../presentation/screens/transfer/transfer_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const HomeScreen(),
        );
      case AppRoutes.cardDetails:
        final card = settings.arguments is CardModel
            ? settings.arguments as CardModel
            : null;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => CardDetailsScreen(card: card),
        );
      case AppRoutes.profile:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const ProfileScreen(),
        );
      case AppRoutes.notifications:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const NotificationsScreen(),
        );
      case AppRoutes.messages:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const MessagesScreen(),
        );
      case AppRoutes.settings:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const SettingsScreen(),
        );
      case AppRoutes.transfer:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const TransferScreen(),
        );
      case AppRoutes.addCard:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const AddCardScreen(),
        );
      default:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const StubScreen(title: 'Not Found'),
        );
    }
  }
}
