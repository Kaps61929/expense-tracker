import 'package:flutter/material.dart';
import './model/transaction.dart';

class AddTransaction extends StatefulWidget {
  final Function addtrans;
  AddTransaction(this.addtrans);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final amountcontroller = TextEditingController();

  final titlecontroller = TextEditingController();

  @override
  void submit() {
    final amount = double.parse(amountcontroller.text);
    final title = titlecontroller.text;
    if (title.isEmpty || amount <= 0) {
      return;
    }

    widget.addtrans(title: title, amount: amount);
    Navigator.of(context).pop();
  }

  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Title'),

          // onChanged: (val) => title = val,
          controller: titlecontroller,
          onSubmitted: (_) => submit(),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Amount'),
          // onChanged: (val) => amount = val,
          controller: amountcontroller,
          keyboardType: TextInputType.number,
          onSubmitted: (_) => submit(),
        ),
        TextButton(
            onPressed: submit,
            child: Text(
              "Add Transaction",
              style: TextStyle(
                  color: Color.fromARGB(255, 61, 250, 90), fontSize: 16),
            ))
      ]),
    );
  }
}
