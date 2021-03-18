import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartBar extends StatelessWidget {
  final double amount;
  final double fraction;
  final DateTime date;

  const ChartBar({
    Key key,
    this.amount,
    this.fraction,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) => Column(
        children: [
          Container(
              height: constraints.maxHeight * .13,
              child: FittedBox(child: Text('\$${amount.toStringAsFixed(2)}'))),
          SizedBox(
            height: constraints.maxHeight * .02,
          ),
          Container(
            height: constraints.maxHeight * .7,
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
          SizedBox(
            height: constraints.maxHeight * .02,
          ),
          Container(
              height: constraints.maxHeight * .13,
              child: FittedBox(child: Text(DateFormat.E().format(date)[0])))
        ],
      ),
    );
  }
}
