import 'package:flutter/material.dart';

import '../model/transaction.dart';

class Transactions with ChangeNotifier {
  List<Transaction> _transactions = [
    Transaction(id: '1', title: ' shoes', amount: 22.3, date: DateTime.now()),
    Transaction(id: '1', title: ' shoes', amount: 22.3, date: DateTime.now()),
  ];
  List<Transaction> get transactions {
    return [..._transactions];
  }

  double get totalAmount {
    if (_transactions.isEmpty) {
      return 0;
    }
    double total = 0;
    _transactions.fold(
        total, (previousValue, element) => total += element.amount);
    return total;
  }

  List<double> get amountForEachDay {
    if (_transactions.isEmpty) {
      return [0, 0, 0, 0, 0, 0, 0];
    }
    List<double> list = [];
    DateTime now = DateTime.now();
    for (var i = 6; i >= 0; i--) {
      double total = 0;
      _transactions
          .where((tx) => //check if
              tx.date.day == now.subtract(Duration(days: i)).day)
          .fold(total, (prev, tx) => total += tx.amount);
      list.add(total);
    }
    return list;
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

  void removeTransaction(Transaction tx) {
    _transactions.remove(tx);
    notifyListeners();
  }
}
