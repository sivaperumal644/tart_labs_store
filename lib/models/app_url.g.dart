// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUrl _$AppUrlFromJson(Map<String, dynamic> json) {
  return AppUrl(
    id: json['id'] as int,
    appId: json['app_id'] as int,
    appUrl: json['app_url'] as String,
    description: json['description'] as String,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
    status: json['status'] as int,
  );
}

Map<String, dynamic> _$AppUrlToJson(AppUrl instance) => <String, dynamic>{
      'id': instance.id,
      'app_id': instance.appId,
      'app_url': instance.appUrl,
      'description': instance.description,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'status': instance.status,
    };
