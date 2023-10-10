import 'package:dio/dio.dart';
import 'package:show_booker/data/remote/network/ApiEndPoints.dart';

class ApiLogging extends InterceptorsWrapper{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {

    options.headers['client'] = ApiEndPoints.client;
    options.headers['x-api-key'] = ApiEndPoints.apiKey;
    options.headers['authorization'] = ApiEndPoints.authorization;
    options.headers['api-version'] = ApiEndPoints.apiVersion;
    options.headers['territory'] = ApiEndPoints.territory;

    print("Url - [${options.uri}] Headers -[${options.headers}] Data - [${options.data}]");
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(Response response, ResponseInterceptorHandler handler)  async {
    print("Url - [${response.realUri}] Data - [${response.data}]");
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler)  async {
    print('error ${err.response}');
    super.onError(err, handler);
  }
}