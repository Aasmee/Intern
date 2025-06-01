import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/transaction_model.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<TransactionModel>('transactions');

    return Scaffold(
      appBar: AppBar(title: const Text('Transaction History')),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<TransactionModel> box, _) {
          final transactions = box.values.toList().reversed.toList();

          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final t = transactions[index];
              return ListTile(
                title: Text(t.category),
                subtitle: Text('${t.note} - ${t.date.toLocal()}'.split(' ')[0]),
                trailing: Text(
                  '\$${t.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: t.type == 'Income' ? Colors.green : Colors.red,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
