import 'package:dio/dio.dart';

class ApiException extends DioException {
  final int? statusCode;
  ApiException(
      {required this.statusCode, super.message, RequestOptions? options})
      : super(requestOptions: options ?? RequestOptions());
}
