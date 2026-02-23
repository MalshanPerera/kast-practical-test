import 'package:test_project/data/models/balance_model.dart';

class AccountModel {
  const AccountModel({
    required this.id,
    required this.currency,
    required this.currencySymbol,
    required this.balances,
    required this.accountNumber,
  });

  final String id;
  final String currency;
  final String currencySymbol;
  final List<BalanceModel> balances;
  final String accountNumber;
}
