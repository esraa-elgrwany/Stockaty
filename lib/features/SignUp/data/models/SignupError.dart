class SignupError {
  SignupError({
      this.errors,});

  SignupError.fromJson(dynamic json) {
    errors = json['errors'] != null ? Error.fromJson(json['errors']) : null;
  }
  Error? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    return map;
  }

}

class Error {
  Error({
      this.value,
      this.msg,
      this.param,
      this.location,});

  Error.fromJson(dynamic json) {
    value = json['value'];
    msg = json['msg'];
    param = json['param'];
    location = json['location'];
  }
  String? value;
  String? msg;
  String? param;
  String? location;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['msg'] = msg;
    map['param'] = param;
    map['location'] = location;
    return map;
  }

}