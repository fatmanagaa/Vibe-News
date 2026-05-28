import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/api/api_endpoints.dart';
import 'package:news_app/api/retrofit/model/news/news_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/source_response.dart';

part 'retrofit_services.g.dart';

@RestApi(baseUrl: 'https://newsapi.org')
abstract class RetrofitServices {
  factory RetrofitServices(Dio dio, {String? baseUrl}) = _RetrofitServices;

  @GET(ApiEndpoints.sourceApi)
  Future<SourceResponse> getSources(
    @Query('category') String categoryId,
      @Query('apiKey') String apiKey,


      );
  @GET(ApiEndpoints.newsApi)
  Future<NewsResponse> getNewsBySourceId(
      @Query('sources') String sourceId,
      @Query('apiKey') String apiKey,
      );
}

@JsonSerializable()
class Task {
  const Task({this.id, this.name, this.avatar, this.createdAt});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  final String? id;
  final String? name;
  final String? avatar;
  final String? createdAt;

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}