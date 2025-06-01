import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/transaction_model.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  String _type = 'Expense';
  String _category = '';
  String _note = '';
  double _amount = 0;
  DateTime _date = DateTime.now();

  void _saveTransaction() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final transaction = TransactionModel(
        type: _type,
        category: _category,
        amount: _amount,
        date: _date,
        note: _note,
      );

      final box = Hive.box<TransactionModel>('transactions');
      await box.add(transaction);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Transaction')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              DropdownButtonFormField(
                value: _type,
                items:
                    ['Income', 'Expense']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                onChanged: (val) => setState(() => _type = val!),
                decoration: const InputDecoration(labelText: 'Type'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Category'),
                onSaved: (val) => _category = val!,
                validator: (val) => val!.isEmpty ? 'Enter category' : null,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Note'),
                onSaved: (val) => _note = val!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                onSaved: (val) => _amount = double.parse(val!),
                validator: (val) => val!.isEmpty ? 'Enter amount' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveTransaction,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
