class AuthSuccess {
  AuthSuccess({
      this.accessToken,});

  AuthSuccess.fromJson(dynamic json) {
    accessToken = json['access_token'];
  }
  String? accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    return map;
  }

}