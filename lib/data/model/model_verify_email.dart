import 'package:finily/data/model/auth/model_meta.dart';
import 'package:finily/data/model/model_user.dart';

class ModelVerifyEmail {
  ModelUser? user;
  ModelMeta? meta;

  ModelVerifyEmail({this.user, this.meta});

  factory ModelVerifyEmail.fromJson(Map<String, dynamic> json) {
    return ModelVerifyEmail(
      user: ModelUser.fromJson(json['user']),
      meta: ModelMeta.fromJson(json['meta']),
    );
  }
}
