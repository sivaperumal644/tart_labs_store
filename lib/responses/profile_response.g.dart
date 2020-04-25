// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) {
  return ProfileResponse(
    user: json['clients'] == null
        ? null
        : User.fromJson(json['clients'] as Map<String, dynamic>),
    status: json['status'] as bool,
    error: json['error'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
      'clients': instance.user,
    };
