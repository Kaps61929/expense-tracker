import 'package:expense_tracker/Addtransaction.dart';
//import 'package:expense_tracker/user_transaction.dart';
import 'package:flutter/material.dart';
import './model/transaction.dart';
import 'package:intl/intl.dart';
import './transaction_list.dart';
//import './user_transaction.dart';
import './model/transaction.dart';
import 'package:flutter/src/material/colors.dart';

void main() => runApp(MaterialApp(
    home: MyHomePage(),
    title: 'Flutter-App',
    theme: ThemeData(
      primarySwatch: Colors.green,
      accentColor: Colors.amber,
      fontFamily: 'Quicksand',
    )));

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  final _usertransactions = [
    Transaction(title: "HOME", id: "KJSDK", amount: 20, date: DateTime.now()),
    Transaction(title: "Shoes", id: "KJK", amount: 20, date: DateTime.now())
  ];
  void addtrans({double? amount, String? title, String? id}) {
    final newtx = Transaction(
        title: title as String,
        id: DateTime.now().toString(),
        amount: amount as double,
        date: DateTime.now());

    setState(() {
      _usertransactions.add(newtx);
    });
  }

  void _startAddNewTransaction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (bctx) {
        return GestureDetector(
          child: AddTransaction(addtrans),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Color.fromARGB(255, 61, 250, 90),
        title: Text(
          'Expense Tracker',
          style: TextStyle(fontFamily: 'OpenSans'),
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                _startAddNewTransaction(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              color: Color.fromARGB(255, 61, 250, 90),
              child: Container(width: 100, child: Text('Chart')),
              elevation: 5,
            ),
            TransactionList(_usertransactions),
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewTransaction(context);
        },
      ),
    );
  }
}
