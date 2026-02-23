import '../models/card_model.dart';

abstract final class MockCards {
  MockCards._();

  static const CardModel defaultCard = CardModel(
    id: '1',
    cardNumber: '5436 5436 **** 6643',
    expiryDate: '08/24',
    currency: 'EUR',
    balance: 8199.24,
  );

  static const List<CardModel> cards = [
    CardModel(
      id: '1',
      cardNumber: '5436 5436 **** 6643',
      expiryDate: '08/24',
      currency: 'EUR',
      balance: 8199.24,
    ),
    CardModel(
      id: '2',
      cardNumber: '5436 5436 **** 6643',
      expiryDate: '08/24',
      currency: 'EUR',
      balance: 8199.24,
    ),
    CardModel(
      id: '3',
      cardNumber: '5436 5436 **** 6643',
      expiryDate: '08/24',
      currency: 'EUR',
      balance: 8199.24,
    ),
    CardModel(
      id: '4',
      cardNumber: '5436 5436 **** 6643',
      expiryDate: '08/24',
      currency: 'EUR',
      balance: 8199.24,
    ),
  ];
}
