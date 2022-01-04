import 'package:collection/collection.dart';
import 'package:gooddhan/core/infrastructure/sembast_database.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/category_dio.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/pagination_config.dart';
import 'package:sembast/sembast.dart';

class ListCategoriesLocalService {
  final SembastDatabase _sembastDatabase;
  final _store = intMapStoreFactory.store("categories");

  ListCategoriesLocalService(this._sembastDatabase);

  /// Update or inserert page to sembast database
  Future<void> upsertPage(List<CategoryDTO> dtos, int page) async {
    final sembastPage = page - 1;
    await _store.records(dtos.mapIndexed((index, _) {
      return index + PaginationConfig.itermsPerPage * sembastPage;
    })).put(
      _sembastDatabase.instance,
      dtos.map((e) => e.toJson()).toList(),
    );
  }

  /// Return List of category item from give page number
  Future<List<CategoryDTO>> getPage(int page) async {
    final sembastPage = page - 1;
    final pageJson = await _store.find(
      _sembastDatabase.instance,
      finder: Finder(
        limit: PaginationConfig.itermsPerPage,
        offset: PaginationConfig.itermsPerPage * sembastPage,
      ),
    );
    return pageJson.map((json) => CategoryDTO.fromJson(json.value)).toList();
  }

  /// Return total page contain in local sembast database
  /// totalPage = (numberOfItems / itemInOnePage).ceil()
  Future<int> getLocalPageCount() async {
    final categoryCount = await _store.count(_sembastDatabase.instance);
    return (categoryCount / PaginationConfig.itermsPerPage).ceil();
  }
}
