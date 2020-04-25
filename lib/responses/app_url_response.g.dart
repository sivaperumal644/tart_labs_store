// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_url_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUrlResponse _$AppUrlResponseFromJson(Map<String, dynamic> json) {
  return AppUrlResponse(
    appUrls: (json['appUrls'] as List)
        ?.map((e) =>
            e == null ? null : AppUrl.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'] as bool,
    error: json['error'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$AppUrlResponseToJson(AppUrlResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
      'appUrls': instance.appUrls,
    };
