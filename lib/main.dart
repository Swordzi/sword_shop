/* MIT License
Copyright (c) 2022 Iiro Polso */

import 'package:sword_shop/widgets/user_transactions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_nord_theme/flutter_nord_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  //late String purchaseInput;
  //late String amountInput;

  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NordColors.$0,
      appBar: AppBar(
        backgroundColor: NordColors.$10,
        title: const Text('Expenses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            SizedBox(
              width: double.infinity,
              child: Card(
                color: NordColors.$10,
                child: Text(
                  'Chart',
                ),
                elevation: 5,
              ),
            ),
            UserTransaction(),
          ],
        ),
      ),
    );
  }
}
