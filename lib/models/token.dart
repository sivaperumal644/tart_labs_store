import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
  @JsonKey(name: 'token_type')
  String tokenType;
  @JsonKey(name: 'access_token')
  String accessToken;
  @JsonKey(name: 'expires_in')
  int expiresIn;
  @JsonKey(name: 'refresh_token')
  String refreshToken;

  Token({
    this.tokenType,
    this.accessToken,
    this.expiresIn,
    this.refreshToken,
  });

  factory Token.fromJson(Map<String, dynamic> map) => _$TokenFromJson(map);
  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
