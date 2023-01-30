import 'package:flutter/material.dart';
import './model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> usertransactions;
  TransactionList(this.usertransactions);
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      child: (usertransactions.isEmpty)
          ? Column(
              children: <Widget>[
                Text('No transaction'),
                SizedBox(
                  height: 9,
                ),
                Container(
                    height: 180,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (cnt, index) {
                return Card(
                    child: Row(children: <Widget>[
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2, color: Theme.of(context).primaryColor)),
                      padding: EdgeInsets.all(9),
                      child: Text(
                        "\$${usertransactions[index].amount.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 21),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        usertransactions[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                          DateFormat.yMMMd()
                              .format(usertransactions[index].date as DateTime),
                          style: TextStyle(color: Colors.grey)),
                    ],
                  )
                ]));
              },
              itemCount: usertransactions.length,
            ),
    );
  }
}
