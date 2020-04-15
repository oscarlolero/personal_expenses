import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.userTransaction,
    @required this.deleteTransactionHandler,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function deleteTransactionHandler;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: FittedBox(
            child: Text('\$${userTransaction.amount}'),
          ),
        ),
      ),
      title: Text(
        userTransaction.title,
        style: Theme.of(context).textTheme.title,
      ),
      subtitle: Text(
          DateFormat.yMMMd().format(userTransaction.date)),
      trailing: MediaQuery.of(context).size.width > 360
          ? FlatButton.icon(
        textColor: Theme.of(context).errorColor,
        icon: Icon(Icons.delete),
        label: Text('Delete'),
        onPressed: () => deleteTransactionHandler(
            userTransaction.id),
      )
          : IconButton(
        icon: Icon(
          Icons.delete,
          color: Theme.of(context).errorColor,
        ),
        onPressed: () => deleteTransactionHandler(
            userTransaction.id),
      ),
    );
  }
}