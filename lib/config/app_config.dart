import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfigs {
  static const String baseURL = "https://www.googleapis.com/books/v1";
  static String apiKey = dotenv.env['apiKey']!;
  static const int maxResults = 40;
}
