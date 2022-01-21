import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const User._();
  const factory User(
    @JsonKey(name: "_id") String id,
    String displayName,
    String email,
    String photoUrl,
    String currency,
    bool isVerified,
    num monthlyIncome,
  ) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
