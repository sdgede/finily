class ModelAuthLogin {
  String? email;
  String? password;

  ModelAuthLogin({this.email, this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }

  factory ModelAuthLogin.fromJson(Map<String, dynamic> json) {
    return ModelAuthLogin(email: json['email'], password: json['password']);
  }
}
