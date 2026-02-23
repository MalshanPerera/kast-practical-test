import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/theme/app_color_extension.dart';
import '../../../../core/utils/currency_formatter.dart';
import '../../../../data/models/account_model.dart';

class AccountListItem extends StatefulWidget {
  const AccountListItem({super.key, required this.account, this.onTap});

  final AccountModel account;
  final VoidCallback? onTap;

  @override
  State<AccountListItem> createState() => _AccountListItemState();
}

class _AccountListItemState extends State<AccountListItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final account = widget.account;
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
          onTap: () {
            setState(() => _expanded = !_expanded);
            widget.onTap?.call();
          },
          borderRadius: BorderRadius.circular(AppDimensions.radiusMd),
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.spacingMd),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: colors.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(
                          AppDimensions.radiusSm,
                        ),
                      ),
                      child: Icon(
                        Icons.account_balance_wallet_outlined,
                        color: colors.primary,
                        size: AppDimensions.iconSizeMd,
                      ),
                    ),
                    const SizedBox(width: AppDimensions.spacingMd),
                    Expanded(
                      child: Text(
                        account.accountNumber,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    AnimatedRotation(
                      turns: _expanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: ext?.textHint ?? colors.outline,
                      ),
                    ),
                  ],
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Padding(
                    padding: const EdgeInsets.only(
                      top: AppDimensions.spacingMd,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: account.balances
                          .map(
                            (b) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: AppDimensions.spacingSm,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: colors.primary.withValues(
                                        alpha: 0.1,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        AppDimensions.radiusSm,
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      CurrencyFormatter.symbolFor(b.currency),
                                      style: theme.textTheme.titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: colors.primary,
                                          ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: AppDimensions.spacingMd,
                                  ),
                                  Text(
                                    '${CurrencyFormatter.format(b.balance)} ${b.currency}',
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      color: colors.onSurface,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  crossFadeState: _expanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 200),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
