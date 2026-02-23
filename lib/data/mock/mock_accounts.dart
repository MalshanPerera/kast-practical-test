import '../models/account_model.dart';
import '../models/balance_model.dart';

abstract final class MockAccounts {
  MockAccounts._();

  static const List<AccountModel> accounts = [
    AccountModel(
      id: '1',
      accountNumber: '40832-810-5-7000-012345',
      currency: 'USD',
      currencySymbol: r'$',
      balances: [
        BalanceModel(
          currency: 'USD',
          balance: 18199.24,
          currencyLabel: 'USD - Dollar',
        ),
        BalanceModel(
          currency: 'EUR',
          balance: 18199.24,
          currencyLabel: 'EUR - Euro',
        ),
        BalanceModel(
          currency: 'GBP',
          balance: 18199.24,
          currencyLabel: 'GBP - Pound',
        ),
      ],
    ),
  ];
}
