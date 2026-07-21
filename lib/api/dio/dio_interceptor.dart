import 'package:dio/dio.dart';
import 'package:news_app/api/api_constants.dart';

class DioInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Adding the API Key to the headers for every request
    options.headers.addAll({
      'X-Api-Key': ApiConstants.apiKey,
    });
    print('onRequest: ${options.uri} ,method:${options.method}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('Response: ${response.statusCode} ${response.requestOptions.uri}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('Error: ${err.message} ${err.requestOptions.uri}');
    handler.next(err);
  }
}
