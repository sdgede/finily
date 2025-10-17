import 'package:dio/dio.dart';
import 'package:finily/data/ensensial/respone_by_code_model.dart';
import 'package:flutter/material.dart';

enum MethodType { get, post, put, delete }

class BaseService {
  final Dio dio = Dio();

  Future<ResponseByCodeModel> request({
    required String url,
    required MethodType type,
    BuildContext? context,
    dynamic data,
    Map<String, String>? extraHeaders,
    bool? returnModel,
  }) async {
    try {
      final options = Options(
        headers: {if (extraHeaders != null) ...extraHeaders},
        extra: {if (context != null) 'context': context},
      );

      late final Response response;

      switch (type) {
        case MethodType.get:
          response = await dio.get(
            url,
            queryParameters: data,
            options: options,
          );
          break;

        case MethodType.post:
          dynamic safeData = data;

          if (data is int || data is double) {
            safeData = data.toString();
            options.headers?["Content-Type"] = "text/plain";
          } else if (data is String) {
            options.headers?["Content-Type"] = "text/plain";
          } else if (data is Map) {
            options.headers?["Content-Type"] = "application/json";
          } else if (data is FormData) {
            options.headers?["Content-Type"] = "multipart/form-data";
          }

          response = await dio.post(url, data: safeData, options: options);
          break;

        case MethodType.put:
          response = await dio.put(url, data: data, options: options);
          break;

        case MethodType.delete:
          response = await dio.delete(
            url,
            data: data is Map ? data : null,
            options: options,
          );
          break;
      }

      debugPrint('✅ Response [${response.statusCode}]: ${response.data}');

      return ResponseByCodeModel.fromJson(
        response.statusCode ?? 200,
        response.data,
      );
    } on DioException catch (e) {
      final errorData = e.response?.data ?? {};
      debugPrint('❌ DioException [$url]: ${e.response?.statusCode}');
      debugPrint('📥 Error response: $errorData');

      return ResponseByCodeModel.fromJson(
        e.response?.statusCode ?? 500,
        errorData is Map<String, dynamic> ? errorData : {},
      );
    } catch (e) {
      debugPrint('❌ Unexpected error in request: $e');
      return ResponseByCodeModel(
        httpCode: 500,
        message: 'Unexpected error',
        errorCode: 'UNEXPECTED_ERROR',
        data: null,
      );
    }
  }
}
