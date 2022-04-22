import 'package:dio/dio.dart';
import 'package:dio_example/api/logging.dart';

class Api {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: 'https://reqres.in/api'));

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: 'https://reqres.in/api',
      receiveTimeout: 15000, // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
    ))..interceptors.add(Logging());
    return dio;
  }
}