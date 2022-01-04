// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExpenseDTO _$$_ExpenseDTOFromJson(Map<String, dynamic> json) =>
    _$_ExpenseDTO(
      id: json['_id'] as String,
      title: json['title'] as String,
      category: CategoryDTO.fromJson(json['category'] as Map<String, dynamic>),
      amount: json['amount'] as num,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_ExpenseDTOToJson(_$_ExpenseDTO instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'category': instance.category,
      'amount': instance.amount,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
