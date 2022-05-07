/* MIT License
Copyright (c) 2022 Iiro Polso */

import 'package:flutter/foundation.dart';

import './transaction.dart';

import 'package:flutter/material.dart';
import 'package:flutter_nord_theme/flutter_nord_theme.dart';
import 'package:intl/intl.dart';

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
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New IDE',
      amount: 5.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly snack',
      amount: 2.30,
      date: DateTime.now(),
    )
  ];

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
          Column(
            children: transactions.map((tx) {
              return Card(
                color: NordColors.$10,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: NordColors.$4,
                        width: 3,
                      )),
                      child: Text(
                        '${tx.amount}€',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                          color: NordColors.$3,
                        ),
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            tx.title,
                            style: const TextStyle(
                                fontSize: 16.5, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateFormat('EEEE d. MMMM y').format(tx.date),
                            style:
                                TextStyle(color: NordColors.polarNight.darker),
                          )
                        ])
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
