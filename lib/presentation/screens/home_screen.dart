import 'package:flutter/material.dart';
import 'package:test_project/core/constants/app_colors.dart';
import 'package:test_project/core/constants/app_dimensions.dart';
import 'package:test_project/core/constants/app_strings.dart';
import 'package:test_project/data/models/account_model.dart';
import 'package:test_project/data/models/balance_model.dart';
import 'package:test_project/data/models/card_model.dart';
import 'package:test_project/presentation/widgets/common/section_header.dart';
import 'package:test_project/presentation/widgets/home/account_list_item.dart';
import 'package:test_project/presentation/widgets/home/balance_header.dart';
import 'package:test_project/presentation/widgets/home/card_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<AccountModel> _accounts = [
    AccountModel(
      id: '1',
      accountNumber: '40832-810-5-7000-012345',
      currency: 'USD',
      currencySymbol: '\$',
      balances: [
        BalanceModel(
          currency: 'USD',
          balance: 18199.24,
          currencyLabel: "USD - Dollar",
        ),
        BalanceModel(
          currency: 'EUR',
          balance: 18199.24,
          currencyLabel: "EUR - Euro",
        ),
        BalanceModel(
          currency: 'GBP',
          balance: 18199.24,
          currencyLabel: "GBP - Pound",
        ),
      ],
    ),
  ];

  static const List<CardModel> _cards = [
    CardModel(
      id: '1',
      cardNumber: '5436 5436 **** 6643',
      expiryDate: '08/24',
      currency: 'EUR',
      balance: 8199.24,
    ),
    CardModel(
      id: '2',
      cardNumber: '5436 5436 **** 6643',
      expiryDate: '08/24',
      currency: 'EUR',
      balance: 8199.24,
    ),
    CardModel(
      id: '3',
      cardNumber: '5436 5436 **** 6643',
      expiryDate: '08/24',
      currency: 'EUR',
      balance: 8199.24,
    ),
    CardModel(
      id: '4',
      cardNumber: '5436 5436 **** 6643',
      expiryDate: '08/24',
      currency: 'EUR',
      balance: 8199.24,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primary,
        child: Column(
          children: [
            BalanceHeader(balancePages: _accounts[0].balances),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppDimensions.radiusXl),
                    topRight: Radius.circular(AppDimensions.radiusXl),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 12,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: ListView(
                  padding: const EdgeInsets.only(
                    top: AppDimensions.spacingLg,
                    left: 0,
                    right: 0,
                    bottom: AppDimensions.spacingXl,
                  ),
                  children: [
                    const SectionHeader(title: AppStrings.accounts),
                    ...List.generate(
                      _accounts.length,
                      (i) => Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppDimensions.spacingSm,
                        ),
                        child: AccountListItem(account: _accounts[i]),
                      ),
                    ),
                    const SizedBox(height: AppDimensions.spacingLg),
                    SectionHeader(
                      title: AppStrings.cards,
                      trailing: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppDimensions.spacingMd,
                            vertical: AppDimensions.spacingSm,
                          ),
                          backgroundColor: AppColors.primaryLight.withValues(
                            alpha: 0.3,
                          ),
                          foregroundColor: AppColors.primary,
                          minimumSize: Size.zero,
                        ),
                        child: Text('+ ${AppStrings.addCard}'),
                      ),
                    ),
                    ...List.generate(
                      _cards.length,
                      (i) => Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppDimensions.spacingSm,
                        ),
                        child: CardListItem(
                          card: _cards[i],
                          onTap: () => Navigator.of(
                            context,
                          ).pushNamed('/card-details', arguments: _cards[i]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const _NavFab(onPressed: null),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        surfaceTintColor: Colors.transparent,
        color: AppColors.background,
        shape: const CircularNotchedRectangle(),
        elevation: 0,
        notchMargin: 12,
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavIcon(icon: Icons.dashboard_outlined, selected: true),
              _NavIcon(icon: Icons.chat_bubble_outline),
              const SizedBox(width: 64),
              _NavIcon(icon: Icons.notifications_outlined),
              _NavIcon(icon: Icons.person_outline),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({required this.icon, this.selected = false});

  final IconData icon;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: AppDimensions.iconSizeLg,
      color: selected ? AppColors.primary : AppColors.textHint,
    );
  }
}

class _NavFab extends StatelessWidget {
  const _NavFab({this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      shape: const CircleBorder(),
      elevation: 4,
      child: InkWell(
        onTap: onPressed,
        customBorder: const CircleBorder(),
        child: const SizedBox(
          width: 56,
          height: 56,
          child: Icon(
            Icons.credit_card_outlined,
            color: AppColors.onPrimary,
            size: 28,
          ),
        ),
      ),
    );
  }
}
