import 'package:json_annotation/json_annotation.dart';
import 'package:tart_labs_store/models/app.dart';
import 'package:tart_labs_store/responses/base_response.dart';

part 'app_response.g.dart';

@JsonSerializable()
class AppResponse extends BaseResponse{
  
  @JsonKey(name: 'apps')
  List<App> apps;

  AppResponse({this.apps, status, message, error}) : super(true, message, error);

  factory AppResponse.fromJson(Map<String, dynamic> map) => _$AppResponseFromJson(map);
  Map<String, dynamic> toJson() => _$AppResponseToJson(this);
}