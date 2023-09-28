class AuthError {
  AuthError({
      this.reasons, 
      this.exception,});

  AuthError.fromJson(dynamic json) {
    reasons = json['reasons'] != null ? json['reasons'].cast<String>() : [];
    exception = json['exception'];
  }
  List<String>? reasons;
  String? exception;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['reasons'] = reasons;
    map['exception'] = exception;
    return map;
  }

}