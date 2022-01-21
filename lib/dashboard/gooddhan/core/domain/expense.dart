import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gooddhan/currency/domain/currency.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';

part 'expense.freezed.dart';

@freezed
class Expense with _$Expense {
  const Expense._();
  const factory Expense({
    required String title,
    required String id,
    required Category category,
    required Currency currency,
    required num amount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Expense;
}
