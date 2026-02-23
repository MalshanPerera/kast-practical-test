import 'package:flutter/material.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/theme/app_color_extension.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../data/models/card_model.dart';

class CardListItem extends StatelessWidget {
  const CardListItem({super.key, required this.card, this.onTap});

  final CardModel card;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final ext = theme.extension<AppColorExtension>();

    final padding = responsivePadding(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding.left),
      child: Material(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.spacingMd),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colors.primary.withValues(alpha: 0.1),
                    borderRadius:
                        BorderRadius.circular(AppDimensions.radiusSm),
                  ),
                  child: Icon(
                    Icons.credit_card_outlined,
                    color: colors.primary,
                    size: AppDimensions.iconSizeMd,
                  ),
                ),
                const SizedBox(width: AppDimensions.spacingMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${card.currency} *${card.cardNumber.split(' ').last}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: colors.onSurface,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.spacingXs),
                      Text(
                        '${CurrencyFormatter.format(card.balance)} ${card.currency}',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 12,
                          color: ext?.textSecondary ?? colors.outline,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: ext?.textHint ?? colors.outline,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
