import 'package:flutter/material.dart';

import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/responsive.dart';
import '../../../core/theme/app_color_extension.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../data/mock/mock_data.dart';
import '../../../data/models/card_model.dart';
import '../../widgets/list_items/operation_list_item.dart';
import 'widgets/credit_card_widget.dart';

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
    final card = widget.card ?? MockCards.defaultCard;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final ext = theme.extension<AppColorExtension>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.surfaceContainerHighest,
        foregroundColor: colors.onSurface,
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
            color: colors.surfaceContainerHighest,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: responsivePadding(context).copyWith(
                    top: AppDimensions.spacingMd,
                    bottom: AppDimensions.spacingMd,
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          CurrencyFormatter.formatBalance(
                            card.balance,
                            card.currency,
                          ),
                          style: theme.textTheme.headlineLarge?.copyWith(
                            color: colors.onSurface,
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
                  color: colors.surface,
                  child: TabBar(
                    controller: _tabController,
                    labelColor: colors.primary,
                    unselectedLabelColor: ext?.textHint ?? colors.outline,
                    indicatorColor: colors.primary,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: UnderlineTabIndicator(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.radiusMd,
                      ),
                      borderSide: BorderSide(
                        width: 2.5,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: colors.primary,
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
              color: colors.surfaceContainerHighest,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _OperationsTab(),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimensions.spacingXl),
                      child: Text(
                        AppStrings.noHistoryYet,
                        style: TextStyle(
                          color: ext?.textSecondary ?? colors.outline,
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

class _OperationsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final operations = MockOperations.operations;
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
          child: OperationListItem(
            title: op.title,
            icon: op.icon,
            onTap: () {},
          ),
        );
      },
    );
  }
}
