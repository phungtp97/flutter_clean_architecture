// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'] as String?,
      id: json['id'] as int?,
      createdAt:
          const EpochDateTimeConverter().fromJson(json['createdAt'] as int),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'createdAt': const EpochDateTimeConverter().toJson(instance.createdAt),
    };
