import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';
import '../providers/transactions_provider.dart';

class InputFields extends StatefulWidget {
  @override
  _InputFieldsState createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  var titleController = TextEditingController();

  var amountController = TextEditingController();

  DateTime datePicked;
  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'amount'),
              keyboardType: TextInputType.number,
              controller: amountController,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(datePicked == null
                          ? 'pick a date'
                          : 'Your date ${DateFormat('dd/MM/yyyy').format(datePicked)}')),
                  TextButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate:
                                    DateTime.now().subtract(Duration(days: 6)),
                                lastDate: DateTime.now())
                            .then((newDate) {
                          setState(() {
                            datePicked = newDate;
                          });
                        });
                      },
                      child: Text('Pick'))
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (titleController.text.isEmpty ||
                      amountController.text.isEmpty ||
                      datePicked == null) {
                    return;
                  }
                  Provider.of<Transactions>(context, listen: false)
                      .addTransaction(Transaction(
                          id: DateTime.now().toString(),
                          title: titleController.text,
                          amount: double.parse(amountController.text),
                          date: datePicked));
                  Navigator.of(context).pop();
                },
                child: Text('Submite')),
          ],
        ),
      ),
    );
  }
}
