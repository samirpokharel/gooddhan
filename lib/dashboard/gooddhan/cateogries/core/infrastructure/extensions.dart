import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/category_dio.dart';

extension DTOListTODomainList on List<CategoryDTO> {
  List<Category> toDomain() => map((e) => e.toDomain()).toList();
}
