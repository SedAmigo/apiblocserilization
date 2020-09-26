// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_responce.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponce _$UserResponceFromJson(Map<String, dynamic> json) {
  return UserResponce(
    users: (json['users'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    error: json['error'] as String,
  );
}

Map<String, dynamic> _$UserResponceToJson(UserResponce instance) =>
    <String, dynamic>{
      'users': instance.users,
      'error': instance.error,
    };
