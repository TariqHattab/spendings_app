import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/transactions_provider.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<double> weekList = Provider.of<Transactions>(context).amountForEachDay;
    double totalAmount = Provider.of<Transactions>(context).totalAmount;
    var i = 6;
    return LayoutBuilder(
        builder: (ctx, constraints) => Card(
              margin: const EdgeInsets.all(15),
              elevation: 4,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: weekList
                      .map((amountDay) => ChartBar(
                          amount: amountDay,
                          fraction: amountDay / totalAmount,
                          date: DateTime.now().subtract(Duration(days: i--))))
                      .toList(),
                ),
              ),
            ));
  }
}

class ChartBar extends StatelessWidget {
  final double amount;
  final double fraction;
  final DateTime date;

  const ChartBar({Key key, this.amount, this.fraction, this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 10, child: FittedBox(child: Text('\$$amount'))),
        Container(
          height: 60,
          width: 10,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1, color: Colors.grey.shade300)),
          child: FractionallySizedBox(
            heightFactor: fraction,
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
        Text(DateFormat.E().format(date)[0])
      ],
    );
  }
}
