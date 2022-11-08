import "package:dio/dio.dart";
import 'package:flutter/services.dart';

class Client {
  Dio init() {
    Dio dio = Dio();

    dio.interceptors.add(ApiInterceptors());
    dio.options.baseUrl = "http://practice.com/api";

    return dio;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print('REQUEST[${options.method}] => PATH: ${options.path}');

    switch (options.path) {
      case '/pet':
        String response = await rootBundle.loadString('assets/data/pets.json');
        await Future.delayed(const Duration(seconds: 2));
        return handler.resolve(
            Response(requestOptions: options, data: response, statusCode: 200),
            true);
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    return super.onError(err, handler);
  }
}
