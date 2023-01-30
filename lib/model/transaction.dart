import 'package:flutter/foundation.dart';

class Transaction {
  final String title;
  final String id;
  final double amount;
  final DateTime? date;
  Transaction(
      {@required this.title = ".",
      @required this.id = ".",
      @required this.amount = 0.00,
      @required this.date});
}
