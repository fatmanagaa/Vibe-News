import 'package:dio/dio.dart';
// ...existing code...

class DioInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // You can add headers, log requests, or modify the request here
    print('onRequest: ${options.baseUrl} ,method:${options.method}');
    // Continue the request chain. Do NOT call `super` after calling handler.*
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // You can log responses or modify the response here
    print('Response: ${response.statusCode} ${response.requestOptions.path}');
    // Propagate the response to the next interceptor / caller
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // You can log errors or handle them here
    print('Error: ${err.message} ${err.requestOptions.path}');
    // Propagate the error
    handler.next(err);
  }

}
// class DioInterceptor implements Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     print('onRequest: ${options.baseUrl} ,method:${options.method}');
//     options.headers.addAll({
//       'X-Api-Key': ApiConstants.apiKey});
//     handler.next(options);
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     print('onResponse: ${response.statusCode} ${response.requestOptions.path}');
//     handler.next(response);
//   }
//
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     handler.next(err);
//   }
// }