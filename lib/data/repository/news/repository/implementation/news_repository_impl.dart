import 'package:injectable/injectable.dart';
import 'package:news_app/data/repository/news/data_source/remote/news_remote_data_source.dart';

import '../../../../../model/news_response.dart';
import '../news_repository.dart';
@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource newsRemoteDataSource;
  NewsRepositoryImpl({required this.newsRemoteDataSource});
  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) {
    return newsRemoteDataSource.getNewsBySourceId(sourceId);
  }
}