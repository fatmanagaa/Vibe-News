//todo: repository implementation implements Repository
import 'package:news_app/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:news_app/model/source_response.dart';

import '../source_repository.dart';

class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource sourceRemoteDataSource;

  SourceRepositoryImpl({required this.sourceRemoteDataSource});

  @override
  Future<SourceResponse> getSources(String categoryId) {
    return sourceRemoteDataSource.getSources(categoryId);
  }
}