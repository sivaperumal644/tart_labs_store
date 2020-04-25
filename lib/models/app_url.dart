import 'package:json_annotation/json_annotation.dart';
part 'app_url.g.dart';

@JsonSerializable()
class AppUrl{
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'app_id')
  int appId;
  @JsonKey(name: 'app_url')
  String appUrl;
  @JsonKey(name: 'description')
  String description;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  @JsonKey(name: 'status')
  int status;
  
  AppUrl({
    this.id,
    this.appId,
    this.appUrl,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.status,
  });

  factory AppUrl.fromJson(Map<String, dynamic> map) => _$AppUrlFromJson(map);
  Map<String, dynamic> toJson() => _$AppUrlToJson(this);
}