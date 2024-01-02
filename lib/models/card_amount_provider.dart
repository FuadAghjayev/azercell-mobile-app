import 'package:flutter/material.dart';
import 'amount_model.dart';

class CardAmountProvider extends ChangeNotifier {
  CardAmountModel _cardAmounts;
  CardAmountProvider(this._cardAmounts);
  double get firstCardAmount => _cardAmounts.firstCardAmount;
  double get secondCardAmount => _cardAmounts.secondCardAmount;


  void updateAmounts(double newFirstCardAmount, double newSecondCardAmount) {
    _cardAmounts = CardAmountModel(
      firstCardAmount: newFirstCardAmount,
      secondCardAmount: newSecondCardAmount,
    );
    notifyListeners();
  }
}
