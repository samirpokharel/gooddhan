import 'package:dio/dio.dart';
import 'package:gooddhan/core/infrastructure/dio_extension.dart';
import 'package:gooddhan/core/infrastructure/network_exception.dart';
import 'package:gooddhan/core/infrastructure/remote_response.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/category_dio.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/gooddhan_header_cache.dart';
import 'package:gooddhan/dashboard/gooddhan/core/infrastructure/gooddhan_headers.dart';

abstract class CategoriesRemoteService {
  final Dio _dio;
  final GooddhanHeaderCache _headerCache;

  CategoriesRemoteService(this._dio, this._headerCache);

  Future<RemoteResponse<List<CategoryDTO>>> getPage({
    required Uri requestUri,
    required List<dynamic> Function(dynamic json) jsonDataSelector,
  }) async {
    print(requestUri.toString());
    final previousHeader = await _headerCache.getHeaders(requestUri);
    try {
      final response = await _dio.getUri(
        requestUri,
        options: Options(
          headers: {"If-None-Match": previousHeader?.etag ?? ""},
        ),
      );
      print(response.data);
      if (response.statusCode == 304) {
        return RemoteResponse.notModified(
          totalPage: previousHeader?.totalPage ?? 0,
        );
      } else if (response.statusCode == 200) {
        final headers = GooddhanHeaders.parse(response);
        await _headerCache.saveHeader(requestUri, headers);
        final convertedData = jsonDataSelector(response.data)
            .map((e) => CategoryDTO.fromJson(e))
            .toList();
        return RemoteResponse.withNewData(
          convertedData,
          totalpage: headers.totalPage ?? 1,
        );
      } else {
        throw RestApiException(response.statusCode);
      }
    } on DioError catch (e) {
      print(e.response?.data);
      if (e.isNoConnectionError) {
        return const RemoteResponse.noConnection();
      } else if (e.response != null) {
        throw RestApiException(e.response?.statusCode);
      } else {
        rethrow;
      }
    }
  }
}
