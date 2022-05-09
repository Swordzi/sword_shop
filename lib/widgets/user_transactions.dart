/* MIT License
Copyright (c) 2022 Iiro Polso */

import 'new_transaction.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

import 'package:flutter/material.dart';



class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
      NewTransaction(),
      TransactionList(_uTransactions),
      ],
    );
  }
}
