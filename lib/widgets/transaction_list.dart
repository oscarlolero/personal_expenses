import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransactionHandler;

  TransactionList(this.userTransactions, this.deleteTransactionHandler);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'No transactions added yet.',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(height: 20),
              Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ))
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text('\$${userTransactions[index].amount}'),
                      ),
                    ),
                  ),
                  title: Text(
                    userTransactions[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(DateFormat.yMMMd()
                      .format(userTransactions[index].date)),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).errorColor,
                    ),
                    onPressed: () => deleteTransactionHandler(userTransactions[index].id),
                  ),
                ),
              );
            },
            itemCount: userTransactions.length,
          );
  }
}
