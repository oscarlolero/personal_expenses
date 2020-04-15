import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';
class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransactionHandler;

  TransactionList(this.userTransactions, this.deleteTransactionHandler);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No transactions added yet.',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(height: 20),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: TransactionItem(userTransaction: userTransactions[index], deleteTransactionHandler: deleteTransactionHandler),
              );
            },
            itemCount: userTransactions.length,
          );
  }
}
