import 'package:finily/data/ensensial/respone_by_code_model.dart';
import 'package:finily/res/constant/enpoints.dart';
import 'package:finily/services/base_service.dart';

class RegisterApi extends BaseService {
  Future<ResponseByCodeModel> register({
    required String email,
    required String password,
    required String name,
    required bool isTermsAccepted,
  }) async {
    try {
      var data = {
        "email": email,
        "password": password,
        "name": name,
        "terms": isTermsAccepted,
      };

      final ResponseByCodeModel response = await request(
        url: AppEndpoints.register,
        type: MethodType.post,
        data: data,
      );

      return response;
    } catch (e) {
      return ResponseByCodeModel(
        httpCode: -1,
        message: e.toString(),
        data: null,
      );
    }
  }
}
