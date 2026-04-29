import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/news_response.dart';
import '../model/source_response.dart';
import 'api_constants.dart';
import 'api_endpoints.dart';

class ApiManger {
  // https://newsapi.org/v2/top-headlines/sources?apiKey=766d06a223d24570be90b8045f095011
  static Future<SourceResponse> getSources() async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiEndpoints.sourceApi, {
      'apiKey': ApiConstants.apiKey,
    });

    try {
      var response = await http.get(url);
      SourceResponse.fromJson(jsonDecode(response.body));
      // ده بيعمل كل اللي تحت

      var responseBody = response.body; //String
      // convert String to json
      var responseJson = jsonDecode(responseBody);
      // convert json to object
      return SourceResponse.fromJson(responseJson);
    } catch (e) {
      rethrow;
    }
  }

  //https://newsapi.org/v2/everything?&apiKey=766d06a223d24570be90b8045f095011
  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiEndpoints.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
    });

    try {
      var response = await http.get(url);

      var responseBody = response.body; //String
      // convert String to json
      var responseJson = jsonDecode(responseBody);
      // convert json to object
      return NewsResponse.fromJson(responseJson);
    } catch (e) {
      rethrow;
    }
  }
}
