/* MIT License
Copyright (c) 2022 Iiro Polso */

import 'package:flutter/material.dart';
import 'package:flutter_nord_theme/flutter_nord_theme.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                addTx(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              style: TextButton.styleFrom(primary: NordColors.aurora.purple),
            )
          ],
        ),
      ),
    );
  }
}
