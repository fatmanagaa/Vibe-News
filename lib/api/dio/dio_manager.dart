import 'package:dio/dio.dart';
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/api_endpoints.dart';
import 'package:news_app/api/dio/dio_interceptor.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioManager {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://newsapi.org/v2/",
      // queryParameters: {'apiKey': ApiConstants.apiKey},
      // headers: {
      //   'X-Api-Key': ApiConstants.apiKey,
      // },
      receiveTimeout: Duration(seconds: 30),
      connectTimeout: Duration(seconds: 30),
      receiveDataWhenStatusError: true,
    ),
  );

  // DioManager() {
  //   dio.interceptors.add(
  //     LogInterceptor(
  //       request: true,
  //       requestUrl: true,
  //       requestBody: true,
  //       requestHeader: true,
  //       responseBody: true,
  //       responseHeader: true,
  //       error: true,
  //     ),
  //   );
  // }
  //todo:another way instead of logInterceptor
  DioManager() {
    dio.interceptors.add(DioInterceptor());
    dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: false,
        maxWidth: 120,
        logPrint: (object) {
          print(object.toString());
        },
      ),
    );
  }

  Future<SourceResponse> getSources(String categoryId) async {
    try {
      var response = await dio.get(
        ApiEndpoints.sourceApi,
        queryParameters: {'category': categoryId},
      );
      var json = response.data;
      return SourceResponse.fromJson(json);
    } on DioException catch (e) {
      print('DioException: ${e.message}');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    try {
      var response = await dio.get(
        ApiEndpoints.newsApi,
        queryParameters: {'sources': sourceId},
      );
      var json = response.data;
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
