/* MIT License
Copyright (c) 2022 Iiro Polso */

import '../models/transaction.dart';

import 'package:flutter/material.dart';
import 'package:flutter_nord_theme/flutter_nord_theme.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 590,
      child: ListView.builder(
        itemBuilder: (bctx, index) {
          return Card(
            color: NordColors.$10,
            child: Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      border: Border.all(
                    color: NordColors.$4,
                    width: 3,
                  )),
                  child: Text(
                    '${transactions[index].amount.toStringAsPrecision(3)}€',
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
                        transactions[index].title,
                        style: const TextStyle(
                          color: NordColors.$15,
                          fontSize: 16.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat('EEEE d. MMMM y')
                            .format(transactions[index].date),
                        style: TextStyle(color: NordColors.polarNight.darker),
                      )
                    ])
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
