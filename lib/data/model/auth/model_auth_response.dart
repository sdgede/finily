import 'package:finily/data/model/auth/model_meta.dart';
import 'package:finily/data/model/model_user.dart';

class ModelAuthResponse {
  ModelUser? user;
  String? token;
  ModelMeta? meta;

  ModelAuthResponse({this.user, this.token, this.meta});

  factory ModelAuthResponse.fromJson(Map<String, dynamic> json) {
    return ModelAuthResponse(
      token: json['token'],
      user: ModelUser.fromJson(json['user']),
      meta: ModelMeta.fromJson(json['meta']),
    );
  }
}
