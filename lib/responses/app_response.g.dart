// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppResponse _$AppResponseFromJson(Map<String, dynamic> json) {
  return AppResponse(
    apps: (json['apps'] as List)
        ?.map((e) => e == null ? null : App.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'],
    message: json['message'],
    error: json['error'],
  );
}

Map<String, dynamic> _$AppResponseToJson(AppResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
      'apps': instance.apps,
    };
