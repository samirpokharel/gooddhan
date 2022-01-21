import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gooddhan_headers.freezed.dart';
part 'gooddhan_headers.g.dart';

@freezed
class GooddhanHeaders with _$GooddhanHeaders {
  const GooddhanHeaders._();
  const factory GooddhanHeaders({
    String? etag,
    int? totalPage,
  }) = _GithubHeaders;
  factory GooddhanHeaders.fromJson(Map<String, dynamic> json) =>
      _$GooddhanHeadersFromJson(json);

  factory GooddhanHeaders.parse(Response response) {
    return GooddhanHeaders(
      totalPage: int.parse(response.headers.map["Totalpage"]?[0] as String),
      etag: response.headers.map["Etag"]?[0],
    );
  }
}
