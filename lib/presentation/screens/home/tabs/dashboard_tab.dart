import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/navigation/app_routes.dart';
import '../../../../core/navigation/navigation_service.dart';
import '../../../../data/models/account_model.dart';
import '../../../../data/models/card_model.dart';
import '../../../widgets/common/section_header.dart';
import '../widgets/account_list_item.dart';
import '../widgets/balance_header.dart';
import '../widgets/card_list_item.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({
    super.key,
    required this.accounts,
    required this.cards,
  });

  final List<AccountModel> accounts;
  final List<CardModel> cards;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      color: colors.primary,
      child: Column(
        children: [
          BalanceHeader(
            balancePages: accounts.isNotEmpty ? accounts.first.balances : [],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: colors.surfaceContainerHighest,
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
                padding: responsivePadding(context).copyWith(
                  top: AppDimensions.spacingLg,
                  bottom: AppDimensions.spacingXl,
                ),
                children: [
                  const SectionHeader(title: AppStrings.accounts),
                  ...List.generate(
                    accounts.length,
                    (i) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppDimensions.spacingSm,
                      ),
                      child: AccountListItem(account: accounts[i]),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.spacingLg),
                  SectionHeader(
                    title: AppStrings.cards,
                    trailing: FilledButton(
                      onPressed: () => NavigationService.toAddCard(),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimensions.spacingMd,
                          vertical: AppDimensions.spacingSm,
                        ),
                        backgroundColor:
                            colors.primaryContainer.withValues(alpha: 0.3),
                        foregroundColor: colors.primary,
                        minimumSize: Size.zero,
                      ),
                      child: Text('+ ${AppStrings.addCard}'),
                    ),
                  ),
                  ...List.generate(
                    cards.length,
                    (i) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: AppDimensions.spacingSm,
                      ),
                      child: CardListItem(
                        card: cards[i],
                        onTap: () => Navigator.of(context).pushNamed(
                          AppRoutes.cardDetails,
                          arguments: cards[i],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
