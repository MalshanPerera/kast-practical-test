import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/utils/currency_formatter.dart';
import '../../../data/models/balance_model.dart';
import '../common/primary_button.dart';

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
    viewportFraction: 0.88,
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

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        AppDimensions.spacingMd,
        AppDimensions.spacingMd,
        AppDimensions.spacingMd,
        AppDimensions.spacingLg,
      ),
      decoration: const BoxDecoration(color: AppColors.primary),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: AppDimensions.avatarSize / 2,
                  backgroundColor: AppColors.onPrimary,
                  child: Icon(Icons.person, color: AppColors.primary),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search, color: AppColors.onPrimary),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 2,
                                    right: 2,
                                  ),
                                  child: Text(
                                    CurrencyFormatter.symbolFor(item.currency),
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.onPrimary,
                                    ),
                                  ),
                                ),
                                Text(
                                  CurrencyFormatter.format(item.balance),
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppDimensions.spacingXs),
                            Text(
                              item.currencyLabel,
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.onPrimary,
                              ),
                            ),
                          ],
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
