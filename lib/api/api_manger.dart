import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../model/news_response.dart';
import '../model/source_response.dart';
import 'api_constants.dart';
import 'api_endpoints.dart';
@singleton
class ApiManger {
  // https://newsapi.org/v2/top-headlines/sources?apiKey=766d06a223d24570be90b8045f095011
   Future<SourceResponse> getSources( String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiEndpoints.sourceApi, {
      'apiKey': ApiConstants.apiKey,
      'category': categoryId,
    });

    try {
      final response = await http.get(url);

      // Ensure we received a 200 OK - otherwise the body may be HTML (error page)
      if (response.statusCode != 200) {
        throw Exception(
            'Failed to load sources (status: ${response.statusCode}). Body: ${response.body}');
      }

      final responseBody = response.body; // String
      final responseJson = jsonDecode(responseBody);
      return SourceResponse.fromJson(responseJson);
    } catch (e) {
      rethrow;
    }
  }

  //https://newsapi.org/v2/everything?&apiKey=766d06a223d24570be90b8045f095011
  //https://newsapi.org/v2/everything?&apiKey=766d06a223d24570be90b8045f095011

  Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiEndpoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
    });

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception(
            'Failed to load news (status: ${response.statusCode}). Body: ${response.body}');
      }

      final responseBody = response.body;
      final responseJson = jsonDecode(responseBody);
      return NewsResponse.fromJson(responseJson);
    } catch (e) {
      rethrow;
    }
  }
}