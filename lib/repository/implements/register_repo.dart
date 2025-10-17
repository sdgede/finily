import 'package:finily/data/api/register_api.dart';
import 'package:finily/data/model/auth/model_auth_response.dart';
import 'package:finily/repository/interface/register_int.dart';

class RegisterRepo implements RegisterInterface {
  final RegisterApi api;

  RegisterRepo(this.api);

  @override
  Future<dynamic> register({
    required String email,
    required String password,
    required String name,
    required bool isTermsAccepted,
  }) async {
    final response = await api.register(
      email: email,
      password: password,
      name: name,
      isTermsAccepted: isTermsAccepted,
    );

    if (response.httpCode == 201) {
      final userData = ModelAuthResponse.fromJson(response.data);
      return userData;
    }

    return response;
  }
}
