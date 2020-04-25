import 'package:json_annotation/json_annotation.dart';
import 'package:tart_labs_store/models/user.dart';
import 'package:tart_labs_store/responses/base_response.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse extends BaseResponse {
  @JsonKey(name: 'clients')
  User user;

  ProfileResponse({
    this.user,
    bool status,
    String error,
    String message,
  }) : super(true, error, message);

  factory ProfileResponse.fromJson(Map<String, dynamic> map) => _$ProfileResponseFromJson(map);
  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
