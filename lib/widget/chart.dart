import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/chart_bar.dart';
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
                      .map((amountEachDay) => Flexible(
                            child: ChartBar(
                              amount: amountEachDay,
                              fraction: totalAmount == 0
                                  ? 0
                                  : amountEachDay / totalAmount,
                              date:
                                  DateTime.now().subtract(Duration(days: i--)),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ));
  }
}
