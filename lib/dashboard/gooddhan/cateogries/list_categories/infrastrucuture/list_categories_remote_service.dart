import 'package:dio/dio.dart';
import 'package:gooddhan/core/infrastructure/remote_response.dart';
import 'package:gooddhan/core/shared/constant.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/infrastructure/categories_remote_service.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/category_dio.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/gooddhan_header_cache.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/pagination_config.dart';

class ListCategoryRemoteService extends CategoriesRemoteService {
  ListCategoryRemoteService(Dio dio, GooddhanHeaderCache headerCache)
      : super(dio, headerCache);

  Future<RemoteResponse<List<CategoryDTO>>> getCategoryListPage(int page) {
    return super.getPage(
      requestUri: Uri.parse(
        "$baseUrl/categories?page=$page&limit=${PaginationConfig.itermsPerPage}",
      ),
      jsonDataSelector: (data) => data["data"] as List<dynamic>,
    );
  }
}
