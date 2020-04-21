class Token {
  final String tokenType;
  final String accessToken;
  final int expiresIn;
  final String refreshToken;

  Token({
    this.tokenType,
    this.accessToken,
    this.expiresIn,
    this.refreshToken,
  });

  factory Token.fromJson(Map json) {
    return Token(
      tokenType: json['token_type'],
      accessToken: json['access_token'],
      expiresIn: json['expires_in'],
      refreshToken: json['refresh_token']
    );
  }
}
