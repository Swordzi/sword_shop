/* MIT License
Copyright (c) 2022 Iiro Polso */

import 'package:flutter/foundation.dart';
import 'package:sword_shop/models/preferences.dart';
import 'package:sword_shop/widgets/transaction_list.dart';
import 'models/transaction.dart';
import 'widgets/new_transaction.dart';
import 'containers/chart_container.dart';
import 'widgets/pie_chart.dart';


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<Preferences> _uPreferences = [
    Preferences(
      closeMenu: true,
      theme: 1,
    )
  ];

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("Test");
    }
    return const MaterialApp(
      title: 'Expenses',
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  //late String purchaseInput;
  //late String amountInput;

  const _MyHomePage({Key? key}) : super(key: key);

  @override
  State<_MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  final List<Transaction> _uTransactions = [
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
  void _addTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      id: DateTime.now().toString(),
      date: DateTime.now(),
    );
    setState(() {
      _uTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2e3440),
      appBar: AppBar(
        backgroundColor: const Color(0xFF5e81ac),
        title: const Text('Expenses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              width: double.infinity,
              child: Card(
                color: Color(0xFF5e81ac),
                child: ChartContainer( title: 'Pie Chart',
                  color: Color(0xff24b273),
                  chart: PieChartContent()
                ),
                elevation: 5,
              ),
            ),
            TransactionList(_uTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
