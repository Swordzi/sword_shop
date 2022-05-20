/* MIT License
Copyright (c) 2022 Iiro Polso */


import 'package:flutter/material.dart';


class NewTransaction extends StatefulWidget {
  final Function addTx;

  const NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitTx() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );
    // TODO: Implement checking if closeMenu is true then enable this.
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFd8dee9),
      elevation: 5,
      child: Container(
        height: 300,
        decoration:
            BoxDecoration(border: Border.all(color: Color(0xFF434c5e), width: 1)),
        padding: const EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Purchase'),
              controller: titleController,
              onSubmitted: (_) => submitTx(),
              //onChanged: (val) => purchaseInput = val,
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Price'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitTx(),
              //onChanged: (val) => amountInput = val,
            ),
            TextButton(
              child: const Text('Add transaction'),
              onPressed: () => submitTx(),
              style: TextButton.styleFrom(primary: Color(0xFFbf616a)),
            )
          ],
        ),
      ),
    );
  }
}
