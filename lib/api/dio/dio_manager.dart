import 'package:dio/dio.dart';
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/api_endpoints.dart';
import 'package:news_app/api/dio/dio_interceptor.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioManager {
  late final Dio dio;

  // Singleton pattern to reuse the same Dio instance throughout the app
  static final DioManager _instance = DioManager._internal();

  factory DioManager() => _instance;

  DioManager._internal() {
    dio = Dio(
      BaseOptions(
        // The root cause of 404 was the extra 'v2/' here, as ApiEndpoints also contains 'v2/'
        baseUrl: "https://${ApiConstants.baseUrl}/",
        receiveTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        receiveDataWhenStatusError: true,
      ),
    );

    // Adding Interceptors
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
      ),
    );
  }

  Future<SourceResponse> getSources(String categoryId) async {
    try {
      var response = await dio.get(
        ApiEndpoints.sourceApi,
        queryParameters: {'category': categoryId},
      );
      return SourceResponse.fromJson(response.data);
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
      return NewsResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
