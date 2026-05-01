import 'package:dio/dio.dart';
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/api_endpoints.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';

class DioManager {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org',
      queryParameters: {'apiKey': ApiConstants.apiKey},
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  static Future<SourceResponse> getSources(String categoryId) async {
    try {
      var response = await dio.get(
        ApiEndpoints.sourceApi,
        queryParameters: {'category': categoryId},
      );
      var json = response.data;
      return SourceResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    try {
      var response = await dio.get(
        ApiEndpoints.newsApi,
        queryParameters: {'source': sourceId},
      );
      var json = response.data;
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
