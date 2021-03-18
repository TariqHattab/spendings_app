import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/chart.dart';
import '../providers/transactions_provider.dart';
import '../model/transaction.dart';
import './transaction_item.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _transactions = Provider.of<Transactions>(context).transactions;

    return LayoutBuilder(
        builder: (ctx, constaints) => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(height: constaints.maxHeight * 0.3, child: Chart()),
                _transactions.isEmpty
                    ? Text(
                        'No Transactions, Add some Transactions',
                        textAlign: TextAlign.center,
                      )
                    : Container(
                        height: constaints.maxHeight * 0.7,
                        child: ListView.builder(
                          itemBuilder: (ctx, i) => TransactionItem(
                            transaction: _transactions[i],
                          ),
                          itemCount: _transactions.length,
                        ),
                      )
              ],
            ));
  }
}
