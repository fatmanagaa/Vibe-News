import 'package:flutter/material.dart';
import 'package:news_app/data/repository/sources/repository/source_repository.dart';
import 'package:news_app/model/source_response.dart';

class SourceViewModel extends ChangeNotifier {
  SourceRepository repository;
  SourceViewModel({required this.repository});

  List<Source>? sourcesList;
  String? errorMessage;

  Future<void> getSources(String categoryId) async {
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await repository.getSources(categoryId);
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
