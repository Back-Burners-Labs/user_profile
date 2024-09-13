import 'dart:io';
import 'package:dio/dio.dart';
import '../../core/constants/app_config.dart';
import '../../modules/auth/controllers/login_controller.dart';

class ApiConfig {
  static Dio get dio {
    final token = LoginController.accessToken;
    return Dio(BaseOptions(baseUrl: AppConfig.baseUrl, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'applicatication/json'
    }));
  }
}

mixin Jsonable {
  fromJson();
  toJson();
}

class CustomHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
