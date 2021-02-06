import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

@module
abstract class InjectableModules {
  @lazySingleton
  http.Client get httpClient => http.Client();

  @lazySingleton
  Logger get logger => Logger();

  @lazySingleton
  FlutterSecureStorage get storage => FlutterSecureStorage();
}