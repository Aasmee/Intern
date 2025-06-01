import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final double income;
  final double expense;

  const BalanceCard({super.key, required this.income, required this.expense});

  @override
  Widget build(BuildContext context) {
    double balance = income - expense;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Balance', style: Theme.of(context).textTheme.titleLarge),
            Text(
              '\$${balance.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Income: \$${income.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.green),
                ),
                Text(
                  'Expense: \$${expense.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
