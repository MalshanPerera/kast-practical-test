import 'package:flutter/material.dart';

import '../../data/models/account_model.dart';
import '../../data/models/card_model.dart';

class AppState {
  final accounts = ValueNotifier<List<AccountModel>>([]);
  final cards = ValueNotifier<List<CardModel>>([]);
  final selectedNavIndex = ValueNotifier<int>(0);

  void updateNavIndex(int index) {
    if (index >= 0 && index <= 3) selectedNavIndex.value = index;
  }

  void loadMockData({
    required List<AccountModel> accounts,
    required List<CardModel> cards,
  }) {
    this.accounts.value = accounts;
    this.cards.value = cards;
  }

  void dispose() {
    accounts.dispose();
    cards.dispose();
    selectedNavIndex.dispose();
  }

  static AppState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_AppStateInherited>()!
        .state;
  }
}

class AppStateProvider extends StatefulWidget {
  const AppStateProvider({super.key, required this.child});

  final Widget child;

  @override
  State<AppStateProvider> createState() => _AppStateProviderState();
}

class _AppStateProviderState extends State<AppStateProvider> {
  final _state = AppState();

  @override
  void dispose() {
    _state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _AppStateInherited(state: _state, child: widget.child);
  }
}

class _AppStateInherited extends InheritedWidget {
  const _AppStateInherited({required this.state, required super.child});

  final AppState state;

  @override
  bool updateShouldNotify(_AppStateInherited oldWidget) => false;
}
