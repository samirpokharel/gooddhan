import 'package:freezed_annotation/freezed_annotation.dart';

part 'gooddhan_failure.freezed.dart';

@freezed
class GooddhanFailure with _$GooddhanFailure {
  const GooddhanFailure._();
  const factory GooddhanFailure.api(int? statusCode, [String? message]) = _API;
}
