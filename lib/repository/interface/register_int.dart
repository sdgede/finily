class RegisterInterface {
  Future<dynamic> register({
    required String email,
    required String password,
    required String name,
    required bool isTermsAccepted,
  }) async {}
}
