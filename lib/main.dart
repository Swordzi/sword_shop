/* MIT License
Copyright (c) 2022 Iiro Polso */

import './transaction.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_nord_theme/flutter_nord_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
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

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: NordColors.$0,
      appBar: AppBar(
        backgroundColor: NordColors.$10,
        title: const Text('Flutter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const SizedBox(
            width: double.infinity,
            child: Card(
              color: NordColors.$10,
              child: Text('Chart'),
              elevation: 5,
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                color: NordColors.$10,
                child: Row(
                  children: [
                    Container(

                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: NordColors.$4,
                        width: 3,
                      )),
                      child: Text(
                        tx.amount.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 15,
                          color: NordColors.$3,
                        ),
                      ),
                    ),
                    Column(children: <Widget>[
                      Text(tx.title),
                      Text(tx.date.toString())
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
