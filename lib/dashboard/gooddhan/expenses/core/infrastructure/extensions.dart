import 'package:gooddhan/dashboard/gooddhan/core/domain/expense.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/expense_dto.dart';

extension ExpenseDTOtoDomain on List<ExpenseDTO> {
  List<Expense> toDomain() => map((e) => e.toDomain()).toList();
}
