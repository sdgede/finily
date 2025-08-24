import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String baseUrl = dotenv.env['BASE_URL'] ?? "";
  static String apiVersion = dotenv.env['VERSION'] ?? "";
  static String appName = dotenv.env['NAME'] ?? "";
  static String appDescription = dotenv.env['DESCRIPTION'] ?? "";
}
