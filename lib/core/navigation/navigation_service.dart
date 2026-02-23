import 'package:flutter/material.dart';

import '../../data/models/card_model.dart';
import 'app_routes.dart';

class NavigationService {
  NavigationService._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState? get _navigator => navigatorKey.currentState;

  static void toHome() {
    _navigator?.pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
  }

  static void toCardDetails(CardModel card) {
    _navigator?.pushNamed(AppRoutes.cardDetails, arguments: card);
  }

  static void toProfile() {
    _navigator?.pushNamed(AppRoutes.profile);
  }

  static void toNotifications() {
    _navigator?.pushNamed(AppRoutes.notifications);
  }

  static void toMessages() {
    _navigator?.pushNamed(AppRoutes.messages);
  }

  static void toSettings() {
    _navigator?.pushNamed(AppRoutes.settings);
  }

  static void toTransfer() {
    _navigator?.pushNamed(AppRoutes.transfer);
  }

  static void toAddCard() {
    _navigator?.pushNamed(AppRoutes.addCard);
  }

  static void pop<T>([T? result]) {
    _navigator?.pop(result);
  }

  static bool get canPop => _navigator?.canPop() ?? false;
}
