class AccessToken {
  AccessToken({
    required this.accessToken,
    required this.expire,
    required this.refreshToken,
    required this.scopes,
  });

  String accessToken;
  int expire;
  String refreshToken;
  String scopes;

  factory AccessToken.fromJson(Map<String, dynamic> json) => AccessToken(
      accessToken: json["access_token"],
      expire: json["expires_in"],
      scopes: json["scope"],
      refreshToken: json["refresh_token"]);
}
