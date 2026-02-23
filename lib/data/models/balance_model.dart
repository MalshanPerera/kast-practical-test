class BalanceModel {
  const BalanceModel({
    required this.currency,
    required this.balance,
    required this.currencyLabel,
  });

  final String currency;
  final double balance;
  final String currencyLabel;
}
