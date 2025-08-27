class ResponseByCodeModel {
  int httpCode;
  String errorCode;
  String message;
  dynamic data;

  ResponseByCodeModel({
    required this.httpCode,
    required this.message,
    this.errorCode = '00',
    this.data,
  });

  bool isSuccess() {
    return httpCode == 200;
  }

  factory ResponseByCodeModel.fromJson(
    int httpCode,
    Map<String, dynamic> json,
  ) {
    int httoCodeResult = httpCode;

    if (json['status'] != null) {
      String status = json['status'].toString().toLowerCase().trim();
      if (status == 'sukses' || status == 'success') {
        httoCodeResult = 200;
      } else {
        httoCodeResult = 400;
      }
    }

    if (json['error_code'] != null) {
      String errorCode = json['error_code'].toString().trim();
      if (errorCode.isNotEmpty && errorCode != '00' && httpCode == 200) {
        httoCodeResult = 400;
      }
    }

    return ResponseByCodeModel(
      httpCode: httoCodeResult,
      message: json['pesan'] ?? json['message'] ?? 'Terjadi Kesalahan',
      errorCode: "${json['error_code'] ?? '00'}",
      data: json['data'],
    );
  }
}
