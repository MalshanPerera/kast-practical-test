enum CardType { mastercard, visa }

class CardModel {
  const CardModel({
    required this.id,
    required this.cardNumber,
    required this.expiryDate,
    required this.currency,
    required this.balance,
    this.type = CardType.mastercard,
  });

  final String id;
  final String cardNumber;
  final String expiryDate;
  final String currency;
  final double balance;
  final CardType type;
}
