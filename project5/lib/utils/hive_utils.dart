import 'package:hive/hive.dart';
import '../models/transaction_model.dart';

class HiveUtils {
  static final _box = Hive.box<TransactionModel>('transactions');

  static List<TransactionModel> getTransactions() {
    return _box.values.toList();
  }

  static Future<void> addTransaction(TransactionModel transaction) async {
    await _box.add(transaction);
  }

  static Future<void> deleteTransaction(int index) async {
    await _box.deleteAt(index);
  }

  static Future<void> clearAll() async {
    await _box.clear();
  }
}
