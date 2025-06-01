import 'package:flutter/material.dart';
import '../models/transaction_model.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionModel> transactions;
  final int limit;

  const TransactionList({
    super.key,
    required this.transactions,
    this.limit = 5,
  });

  @override
  Widget build(BuildContext context) {
    final displayedTransactions = transactions.reversed.take(limit).toList();

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayedTransactions.length,
      itemBuilder: (context, index) {
        final t = displayedTransactions[index];
        return ListTile(
          leading: Icon(
            t.type == 'Income' ? Icons.arrow_downward : Icons.arrow_upward,
            color: t.type == 'Income' ? Colors.green : Colors.red,
          ),
          title: Text(t.category),
          subtitle: Text('${t.note} • ${t.date.toLocal()}'.split(' ')[0]),
          trailing: Text(
            '\$${t.amount.toStringAsFixed(2)}',
            style: TextStyle(
              color: t.type == 'Income' ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
