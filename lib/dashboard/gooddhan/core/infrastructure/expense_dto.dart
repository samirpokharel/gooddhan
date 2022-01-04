import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/expense.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/category_dio.dart';

part 'expense_dto.freezed.dart';
part 'expense_dto.g.dart';

@freezed
class ExpenseDTO with _$ExpenseDTO {
  const ExpenseDTO._();
  const factory ExpenseDTO({
    @JsonKey(name: "_id") required String id,
    required String title,
    required CategoryDTO category,
    required num amount,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ExpenseDTO;

  factory ExpenseDTO.fromJson(Map<String, dynamic> json) =>
      _$ExpenseDTOFromJson(json);

  factory ExpenseDTO.fromDomain(Expense _) {
    return ExpenseDTO(
      id: _.id,
      amount: _.amount,
      category: CategoryDTO.fromDomain(_.category),
      createdAt: _.createdAt,
      updatedAt: _.updatedAt,
      title: _.title,
    );
  }
  Expense toDomain() {
    return Expense(
      id: id,
      title: title,
      category: category.toDomain(),
      amount: amount,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
