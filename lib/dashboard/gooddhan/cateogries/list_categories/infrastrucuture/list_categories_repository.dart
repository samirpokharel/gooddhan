import 'package:dartz/dartz.dart';
import 'package:gooddhan/core/domain/fresh.dart';
import 'package:gooddhan/core/infrastructure/network_exception.dart';
import 'package:gooddhan/dashboard/gooddhan/cateogries/core/infrastructure/extensions.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/category.dart';
import 'package:gooddhan/dashboard/gooddhan/core/domain/gooddhan_failure.dart';

import 'list_categories_local_service.dart';
import 'list_categories_remote_service.dart';

class ListCategoriesRepository {
  final ListCategoriesLocalService _localService;
  final ListCategoryRemoteService _remoteService;

  ListCategoriesRepository(this._localService, this._remoteService);

  Future<Either<GooddhanFailure, Fresh<List<Category>>>> getCategoryList(
    int page,
  ) async {
    try {
      final remotePageItem = await _remoteService.getCategoryListPage(page);
      return right(
        await remotePageItem.when(
          noConnection: () async {
            return Fresh.no(
              await _localService.getPage(page).then((_) => _.toDomain()),
              isNextPageAvailable:
                  page < await _localService.getLocalPageCount(),
            );
          },
          notModified: (totalPage) async {
            return Fresh.yes(
              await _localService.getPage(page).then((_) => _.toDomain()),
              isNextPageAvailable: page < totalPage,
            );
          },
          withNewData: (data, totalPage) async {
            await _localService.upsertPage(data, page);
            return Fresh.yes(
              data.toDomain(),
              isNextPageAvailable: page < totalPage,
            );
          },
        ),
      );
    } on RestApiException catch (e) {
      return left(GooddhanFailure.api(e.errorCode));
    }
  }
}
