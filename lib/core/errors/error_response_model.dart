

class ErrorResponse {
  String? message;
  Errors? errors;

  ErrorResponse({this.message, this.errors});

  ErrorResponse.fromJson(dynamic json) {
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    return map;
  }
}

class Errors {
  List<String>? firstname;
  List<String>? wardsFirstName;
  List<String>? lastname;
  List<String>? wardsLastName;


  Errors({
    this.firstname,
    this.wardsFirstName,
    this.lastname,
    this.wardsLastName,

  });

  Errors.fromJson(dynamic json) {
    firstname =
        json['firstname'] != null ? json['firstname'].cast<String>() : [];
    wardsFirstName =
        json['first_name'] != null ? json['first_name'].cast<String>() : [];
    lastname = json['lastname'] != null ? json['lastname'].cast<String>() : [];

  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (firstname != null) map['firstname'] = firstname;
    if (wardsFirstName != null) map['first_name'] = wardsFirstName;
    if (lastname != null) map['lastname'] = lastname;
    if (wardsLastName != null) map['last_name'] = wardsLastName;

    return map;
  }
}
