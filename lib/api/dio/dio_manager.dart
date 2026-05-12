import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/api_endpoints.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioManager {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      queryParameters: {'apiKey': ApiConstants.apiKey},
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
  //todo:another way instead logInterceptor
  DioManager(){
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args){
          // don't print requests with uris containing '/posts'
          if(options.path.contains('/posts')){
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        }
    )
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
    } catch (e) {
      rethrow;
    }
  }

   Future<NewsResponse> getNewsBySourceId(String sourceId) async {
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
