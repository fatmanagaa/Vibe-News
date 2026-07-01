import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/model/source_response.dart';

class SourceViewModel extends ChangeNotifier {
  List<Source>? sourcesList;
  String? errorMessage;

  Future<void> getSources(String categoryId) async {
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManger.getSources(categoryId);
      if (response.status == 'error') {
        errorMessage = response.message;
      } else {
        sourcesList = response.sources;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }
}
