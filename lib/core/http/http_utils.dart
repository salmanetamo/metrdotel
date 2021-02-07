import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

extension JsonEncoding on Map {
  String encode() {
    return jsonEncode(this);
  }
}

Uri getHttpUri({
  String endpoint,
  Map<String, String> queryParameters,
  bool withPrefix = false,
  bool isHttp = true,
}) {
  return Uri.http(
      "${withPrefix ? isHttp ? 'http://' : 'https://' : ''}${env["BASE_URL"]}",
      "/$endpoint", queryParameters);
}
