class ModelMeta {
  final String? type;
  final String? message;

  ModelMeta({this.type, this.message});

  factory ModelMeta.fromJson(Map<String, dynamic> json) {
    return ModelMeta(type: json['type'], message: json['message']);
  }
}
