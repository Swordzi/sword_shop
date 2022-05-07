/* MIT License
Copyright (c) 2022 Iiro Polso */

import 'package:flutter/material.dart';
import 'package:flutter_nord_theme/flutter_nord_theme.dart';
import 'package:flutter/foundation.dart';

class NewTransaction extends StatelessWidget {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  
  NewTransaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: 
      Card(
        color: NordColors.snowStorm.lightest,
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(labelText: 'Purchase'),
                controller: nameController,
                //onChanged: (val) => purchaseInput = val,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'Price'),
                controller: priceController,
                //onChanged: (val) => amountInput = val,
              ),
              TextButton(
                child: const Text('Add transaction'),
                onPressed: () {
                  if (kDebugMode) {
                    print(nameController.text);
                  }
                  if (kDebugMode) {
                    print(priceController.text);
                  }
                },
                style:
                TextButton.styleFrom(primary: NordColors.aurora.purple),

              )
            ],
          ),
        ),
      ),
      
    );
  }
}
