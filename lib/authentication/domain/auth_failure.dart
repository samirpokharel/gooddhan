import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const AuthFailure._();
  const factory AuthFailure.server(int? status, [String? message]) = _Searver;
  const factory AuthFailure.storage() = _Storage;
}
