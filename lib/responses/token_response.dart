import 'package:json_annotation/json_annotation.dart';
import 'package:tart_labs_store/models/token.dart';
import 'base_response.dart';

part 'token_response.g.dart';

@JsonSerializable()
class TokenResponse extends BaseResponse {
  @JsonKey(name: "token_type")
  String tokenType;
  @JsonKey(name: "access_token")
  String accessToken;
  @JsonKey(name: "refresh_token")
  String refreshToken;
  @JsonKey(name: "expires_in")
  int expiresIn;

  TokenResponse({
    this.tokenType,
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
    message,
    error,
  }) : super(true, message, error);

  Token getToken() {
    if (message != null && message != "") {
      return null;
    } else {
      return Token(
        accessToken: this.accessToken,
        tokenType: this.tokenType,
        refreshToken: this.refreshToken,
        expiresIn: this.expiresIn,
      );
    }
  }

  factory TokenResponse.fromJson(Map<String, dynamic> map) =>
      _$TokenResponseFromJson(map);
  Map<String, dynamic> toJson() => _$TokenResponseToJson(this);
}
