import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_dimensions.dart';
import '../../core/constants/app_strings.dart';
import '../../core/utils/currency_formatter.dart';
import '../../data/models/card_model.dart';
import '../widgets/card_details/credit_card_widget.dart';
import '../widgets/card_details/operation_list_item.dart';

class CardDetailsScreen extends StatefulWidget {
  const CardDetailsScreen({super.key, this.card});

  final CardModel? card;

  @override
  State<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final card = widget.card ?? _defaultCard;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(AppStrings.card),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.surface,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.spacingMd,
                    vertical: AppDimensions.spacingMd,
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          CurrencyFormatter.formatBalance(
                            card.balance,
                            card.currency,
                          ),
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      const SizedBox(height: AppDimensions.spacingLg),
                      CreditCardWidget(card: card),
                      const SizedBox(height: AppDimensions.spacingLg),
                    ],
                  ),
                ),
                Container(
                  color: AppColors.background,
                  child: TabBar(
                    controller: _tabController,
                    labelColor: AppColors.primary,
                    unselectedLabelColor: AppColors.textHint,
                    indicatorColor: AppColors.primary,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: UnderlineTabIndicator(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMd,
                      ),
                      borderSide: const BorderSide(
                        width: 2.5,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: AppColors.primary,
                      ),
                    ),
                    dividerColor: Colors.transparent,
                    tabs: const [
                      Tab(text: AppStrings.operations),
                      Tab(text: AppStrings.history),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.surface,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _OperationsTab(),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(AppDimensions.spacingXl),
                      child: Text(
                        'No history yet',
                        style: TextStyle(color: AppColors.textSecondary),
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

  static final CardModel _defaultCard = const CardModel(
    id: '1',
    cardNumber: '5436 5436 **** 6643',
    expiryDate: '08/24',
    currency: 'EUR',
    balance: 8199.24,
  );
}

class _OperationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const operations = [
      (AppStrings.topUpCard, Icons.add_circle_outline),
      (AppStrings.payments, Icons.payment_outlined),
      (AppStrings.cardOutput, Icons.arrow_forward),
      (AppStrings.takeAllMoney, Icons.account_balance_wallet_outlined),
      (AppStrings.takeAllMoney, Icons.account_balance_wallet_outlined),
      (AppStrings.takeAllMoney, Icons.account_balance_wallet_outlined),
      (AppStrings.takeAllMoney, Icons.account_balance_wallet_outlined),
      (AppStrings.takeAllMoney, Icons.account_balance_wallet_outlined),
      (AppStrings.takeAllMoney, Icons.account_balance_wallet_outlined),
      (AppStrings.takeAllMoney, Icons.account_balance_wallet_outlined),
      (AppStrings.takeAllMoney, Icons.account_balance_wallet_outlined),
    ];

    return ListView.builder(
      itemCount: operations.length,
      itemBuilder: (context, index) {
        final op = operations[index];
        final isFirst = index == 0;
        return Padding(
          padding: EdgeInsets.only(
            bottom: AppDimensions.spacingSm,
            top: isFirst ? AppDimensions.spacingMd : 0,
          ),
          child: OperationListItem(title: op.$1, icon: op.$2, onTap: () {}),
        );
      },
    );
  }
}
