/* MIT License
Copyright (c) 2022 Iiro Polso */

import 'widgets/transaction_list.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nord_theme/flutter_nord_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //late String purchaseInput;
  //late String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NordColors.$0,
      appBar: AppBar(
        backgroundColor: NordColors.$10,
        title: const Text('Expenses'),
      ),
      // TODO: Fix bottom overflowing
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            width: double.infinity,
            child: Card(
              color: NordColors.$10,
              child: Text('Chart'),
              elevation: 5,
            ),
          ),
          Card(
            color: NordColors.snowStorm.lightest,
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(labelText: 'Purchase'),
                    controller: titleController,
                    //onChanged: (val) => purchaseInput = val,
                  ),
                  TextField(
                    decoration: const InputDecoration(labelText: 'Price'),
                    controller: amountController,
                    //onChanged: (val) => amountInput = val,
                  ),
                  TextButton(
                    child: const Text('Add transaction'),
                    onPressed: () {
                      if (kDebugMode) {
                        print(titleController.text);
                      }
                      if (kDebugMode) {
                        print(amountController.text);
                      }
                    },
                    style:
                        TextButton.styleFrom(primary: NordColors.aurora.purple),
                  )
                ],
              ),
            ),
          ),
          TransactionList(),
        ],
      ),
    );
  }
}
