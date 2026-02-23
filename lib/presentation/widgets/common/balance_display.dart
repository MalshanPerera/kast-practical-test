import 'package:flutter/material.dart';

import '../../../core/constants/app_dimensions.dart';
import '../../../core/utils/currency_formatter.dart';

class BalanceDisplay extends StatelessWidget {
  const BalanceDisplay({
    super.key,
    required this.balance,
    required this.currency,
    required this.color,
    this.currencyLabel,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.showCurrencyLabel = true,
  });

  final double balance;
  final String currency;
  final Color color;
  final String? currencyLabel;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final bool showCurrencyLabel;

  @override
  Widget build(BuildContext context) {
    final label = currencyLabel ?? CurrencyFormatter.labelFor(currency);
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2, right: 2),
              child: Text(
                CurrencyFormatter.symbolFor(currency),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
            Text(
              CurrencyFormatter.format(balance),
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.spacingXs),
        if (showCurrencyLabel)
          Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(color: color),
          ),
      ],
    );
  }
}
