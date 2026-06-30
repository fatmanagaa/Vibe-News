import 'package:flutter/material.dart';
import 'package:news_app/api/dio/dio_manager.dart';
import 'package:news_app/model/news_response.dart';

class NewsViewModel extends ChangeNotifier {
  List<News>? newsList;
  String? errorMessage;

  Future<void> getNews(String sourceId) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();

    try {
      var response = await DioManager().getNewsBySourceId(sourceId);

      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        newsList = response.articles;
      }
    } catch (e) {
      errorMessage = e.toString();
    }

    notifyListeners();
  }
}