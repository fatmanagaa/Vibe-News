//todo: repository implementation implements Repository
import 'package:injectable/injectable.dart';
import 'package:news_app/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:news_app/model/source_response.dart';

import '../source_repository.dart';
@Injectable(as: SourceRepository)
class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource sourceRemoteDataSource;

  SourceRepositoryImpl({required this.sourceRemoteDataSource});

  @override
  Future<SourceResponse> getSources(String categoryId) {
    return sourceRemoteDataSource.getSources(categoryId);
  }
}