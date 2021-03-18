import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widget/input_fields.dart';
import './providers/transactions_provider.dart';
import 'widget/body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (ctx) => Transactions(),
        child: MaterialApp(
          title: 'Flutter Spendings App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  void showBottomSheet(context, inputs) {
    showModalBottomSheet(context: context, builder: (ctx) => inputs);
  }

  @override
  Widget build(BuildContext context) {
    var inputFields = InputFields();
    return Scaffold(
      appBar: AppBar(
        title: Text("Spendings App"),
        actions: [
          IconButton(
            onPressed: () {
              showBottomSheet(context, inputFields);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(context, inputFields);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
