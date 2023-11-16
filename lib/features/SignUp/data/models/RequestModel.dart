class RequestModel {
  String name;
  String email;
  String password;
  String phone;

  RequestModel({required this.name,
    required this.email,
    required this.password,
    required this.phone});

  Map<String, dynamic> toJason() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "rePassword": password,
      "phone": phone
    };
  }
}
