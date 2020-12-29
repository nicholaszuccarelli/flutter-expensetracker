import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: transactions.length,
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
                            padding: const EdgeInsets.all(6),
                            child: FittedBox(
                              child: Text(
                                '\$${transactions[index].amount.toStringAsFixed(2)}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMEd().format(transactions[index].date),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => deleteTx(transactions[index].id),
                      ),
                    ),
                  );
                  // return Card(
                  //   child: Row(children: <Widget>[
                  //     Container(
                  //       padding: EdgeInsets.all(10),
                  //       margin: EdgeInsets.all(20),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(
                  //             color: Theme.of(context).accentColor, width: 2),
                  //       ),
                  //       child: Text(
                  //         '\$${transactions[index].amount.toStringAsFixed(2)}',
                  //         style: TextStyle(
                  //           color: Theme.of(context).primaryColor,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 20,
                  //         ),
                  //       ),
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: <Widget>[
                  //         Text(transactions[index].title,
                  //             style: Theme.of(context).textTheme.headline6),
                  //         Text(
                  //           DateFormat.yMMMEd().format(transactions[index].date),
                  //           style: TextStyle(
                  //             fontSize: 12,
                  //             color: Theme.of(context).primaryColorLight,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ]),
                  // );
                },
              ),
            ),
    );
  }
}
