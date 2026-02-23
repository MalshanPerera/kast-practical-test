import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../models/operation_model.dart';

abstract final class MockOperations {
  MockOperations._();

  static const List<OperationModel> operations = [
    OperationModel(
      id: '1',
      title: AppStrings.topUpCard,
      icon: Icons.add_circle_outline,
    ),
    OperationModel(
      id: '2',
      title: AppStrings.payments,
      icon: Icons.payment_outlined,
    ),
    OperationModel(
      id: '3',
      title: AppStrings.cardOutput,
      icon: Icons.arrow_forward,
    ),
    OperationModel(
      id: '4',
      title: AppStrings.takeAllMoney,
      icon: Icons.account_balance_wallet_outlined,
    ),
    OperationModel(
      id: '5',
      title: AppStrings.takeAllMoney,
      icon: Icons.account_balance_wallet_outlined,
    ),
    OperationModel(
      id: '6',
      title: AppStrings.takeAllMoney,
      icon: Icons.account_balance_wallet_outlined,
    ),
    OperationModel(
      id: '7',
      title: AppStrings.takeAllMoney,
      icon: Icons.account_balance_wallet_outlined,
    ),
    OperationModel(
      id: '8',
      title: AppStrings.takeAllMoney,
      icon: Icons.account_balance_wallet_outlined,
    ),
    OperationModel(
      id: '9',
      title: AppStrings.takeAllMoney,
      icon: Icons.account_balance_wallet_outlined,
    ),
    OperationModel(
      id: '10',
      title: AppStrings.takeAllMoney,
      icon: Icons.account_balance_wallet_outlined,
    ),
    OperationModel(
      id: '11',
      title: AppStrings.takeAllMoney,
      icon: Icons.account_balance_wallet_outlined,
    ),
  ];
}
