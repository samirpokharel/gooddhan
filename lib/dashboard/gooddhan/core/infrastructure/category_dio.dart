import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';

part 'category_dio.freezed.dart';
part 'category_dio.g.dart';

@freezed
class CategoryDTO with _$CategoryDTO {
  const CategoryDTO._();
  const factory CategoryDTO({
    required String categoryName,
    @JsonKey(name: "_id") required String id,
  }) = _CategoryDTO;

  factory CategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$CategoryDTOFromJson(json);

  factory CategoryDTO.fromDomain(Category _) {
    return CategoryDTO(categoryName: _.categoryName, id: _.id);
  }
  Category toDomain() {
    return Category(categoryName: categoryName, id: id);
  }
}
