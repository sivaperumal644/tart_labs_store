import 'package:json_annotation/json_annotation.dart';
import 'package:tart_labs_store/models/app_url.dart';
import 'package:tart_labs_store/responses/base_response.dart';

part 'app_url_response.g.dart';

@JsonSerializable()
class AppUrlResponse extends BaseResponse {
  @JsonKey(name: 'appUrls')
  List<AppUrl> appUrls;
  AppUrlResponse({this.appUrls, bool status, String error, String message})
      : super(true, error, message);

  factory AppUrlResponse.fromJson(Map<String, dynamic> map) =>
      _$AppUrlResponseFromJson(map);
  Map<String, dynamic> toJson() => _$AppUrlResponseToJson(this);
}
