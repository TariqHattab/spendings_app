import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../model/transaction.dart';
import '../providers/transactions_provider.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  const TransactionItem({
    Key key,
    this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(transaction.id),
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.all(16),
        alignment: Alignment.centerRight,
        child: Icon(Icons.delete, size: 40, color: Colors.white),
      ),
      onDismissed: (_) {
        Provider.of<Transactions>(context, listen: false)
            .removeTransaction(transaction);
      },
      child: ListTile(
        leading: CircleAvatar(
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: FittedBox(
              child: Text('\$${transaction.amount.toStringAsFixed(2)}'),
            ),
          ),
        ),
        title: Text(transaction.title),
        subtitle: Text(
            DateFormat('dd MM yyyy hh:mm').format(transaction.date).toString()),
        trailing: IconButton(
          onPressed: () {
            Provider.of<Transactions>(context, listen: false).amountForEachDay;
          },
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
