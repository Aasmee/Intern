import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 0)
class TransactionModel extends HiveObject {
  @HiveField(0)
  String type; // 'Income' or 'Expense'

  @HiveField(1)
  String category;

  @HiveField(2)
  double amount;

  @HiveField(3)
  DateTime date;

  @HiveField(4)
  String note;

  TransactionModel({
    required this.type,
    required this.category,
    required this.amount,
    required this.date,
    required this.note,
  });
}
