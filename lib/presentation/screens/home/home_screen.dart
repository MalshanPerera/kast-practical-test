import 'package:flutter/material.dart';
import '../../../core/navigation/navigation_service.dart';
import '../../../core/state/app_state.dart';
import '../../../data/mock/mock_data.dart';
import '../../widgets/bottom_nav/bottom_nav_bar.dart';
import '../../widgets/bottom_nav/nav_fab.dart';
import 'tabs/dashboard_tab.dart';
import 'tabs/messages_tab.dart';
import 'tabs/notifications_tab.dart';
import 'tabs/profile_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppState.of(context);

    return ValueListenableBuilder<int>(
      valueListenable: state.selectedNavIndex,
      builder: (context, selectedIndex, _) {
        final accounts = state.accounts.value.isNotEmpty
            ? state.accounts.value
            : MockAccounts.accounts;
        final cards = state.cards.value.isNotEmpty
            ? state.cards.value
            : MockCards.cards;

        return Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: [
              DashboardTab(accounts: accounts, cards: cards),
              const MessagesTab(),
              const NotificationsTab(),
              const ProfileTab(),
            ],
          ),
          floatingActionButton: NavFab(
            onPressed: () => NavigationService.toAddCard(),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: AppBottomNavBar(
            selectedIndex: selectedIndex,
            onItemSelected: state.updateNavIndex,
          ),
        );
      },
    );
  }
}
