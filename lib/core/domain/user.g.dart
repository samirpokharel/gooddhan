// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      json['_id'] as String,
      json['displayName'] as String,
      json['email'] as String,
      json['photoUrl'] as String,
      json['currency'] as String,
      json['isVerified'] as bool,
      json['monthlyIncome'] as num,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      '_id': instance.id,
      'displayName': instance.displayName,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'currency': instance.currency,
      'isVerified': instance.isVerified,
      'monthlyIncome': instance.monthlyIncome,
    };
