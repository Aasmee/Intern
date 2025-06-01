import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/transaction_model.dart';
import 'add_transaction.dart';
import 'history.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<TransactionModel>('transactions');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HistoryPage()),
                ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<TransactionModel> box, _) {
          final transactions = box.values.toList();

          double income = transactions
              .where((t) => t.type == 'Income')
              .fold(0, (sum, t) => sum + t.amount);
          double expense = transactions
              .where((t) => t.type == 'Expense')
              .fold(0, (sum, t) => sum + t.amount);

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Balance: \$${(income - expense).toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 22),
                ),
                const SizedBox(height: 10),
                Text('Income: \$${income.toStringAsFixed(2)}'),
                Text('Expense: \$${expense.toStringAsFixed(2)}'),
                const SizedBox(height: 20),
                const Text('Recent Transactions:'),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        transactions.length < 5 ? transactions.length : 5,
                    itemBuilder: (context, index) {
                      final t = transactions.reversed.toList()[index];
                      return ListTile(
                        title: Text(t.category),
                        subtitle: Text(t.note),
                        trailing: Text(
                          '\$${t.amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            color:
                                t.type == 'Income' ? Colors.green : Colors.red,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddTransactionPage(),
              ),
            ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
