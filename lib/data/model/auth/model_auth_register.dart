class ModelAuthRegister {
  String? email;
  String? password;
  String? name;

  ModelAuthRegister({this.email, this.password, this.name});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password, 'name': name};
  }

  factory ModelAuthRegister.fromJson(Map<String, dynamic> json) {
    return ModelAuthRegister(
      email: json['email'],
      password: json['password'],
      name: json['name'],
    );
  }
}
