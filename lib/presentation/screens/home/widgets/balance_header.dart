import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../data/models/balance_model.dart';
import '../../../widgets/buttons/primary_button.dart';
import '../../../widgets/common/balance_display.dart';

class BalanceHeader extends StatefulWidget {
  const BalanceHeader({super.key, required this.balancePages});

  final List<BalanceModel> balancePages;

  @override
  State<BalanceHeader> createState() => _BalanceHeaderState();
}

class _BalanceHeaderState extends State<BalanceHeader> {
  static const int _pageCount = 10000;
  static const int _initialPage = 5000;

  late final PageController _pageController = PageController(
    initialPage: _initialPage,
    viewportFraction: 0.85,
  );

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_recenter);
  }

  @override
  void dispose() {
    _pageController.removeListener(_recenter);
    _pageController.dispose();
    super.dispose();
  }

  void _recenter() {
    if (!_pageController.hasClients || widget.balancePages.isEmpty) return;
    final page = _pageController.page ?? 0;
    final current = page.round();
    if (current < 500 || current > _pageCount - 500) {
      _pageController.jumpToPage(
        _initialPage + (current % widget.balancePages.length),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = widget.balancePages;
    if (pages.isEmpty) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final padding = responsivePadding(context);
    return Container(
      width: double.infinity,
      padding: padding.copyWith(
        top: AppDimensions.spacingMd,
        bottom: AppDimensions.spacingLg,
      ),
      decoration: BoxDecoration(color: colors.primary),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: AppDimensions.avatarSize / 2,
                  backgroundColor: colors.onPrimary,
                  child: Icon(Icons.person, color: colors.primary),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: colors.onPrimary),
                ),
              ],
            ),
            const SizedBox(height: AppDimensions.spacingMd),
            SizedBox(
              height: 72,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pageCount,
                itemBuilder: (context, index) {
                  final item = pages[index % pages.length];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: BalanceDisplay(
                          balance: item.balance,
                          currency: item.currency,
                          color: colors.onPrimary,
                          currencyLabel: item.currencyLabel,
                          mainAxisAlignment: MainAxisAlignment.end,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: AppDimensions.spacingLg),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    label: AppStrings.addMoney,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: AppDimensions.spacingMd),
                Expanded(
                  child: PrimaryButton(
                    label: AppStrings.exchange,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
