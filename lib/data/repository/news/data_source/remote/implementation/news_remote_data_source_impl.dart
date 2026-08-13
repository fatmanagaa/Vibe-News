import 'package:injectable/injectable.dart';
import 'package:news_app/api/api_manger.dart';

import '../../../../../../model/news_response.dart';
import '../news_remote_data_source.dart';
@Injectable(as: NewsRemoteDataSource)
class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final ApiManger apiManager;

  NewsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) {
    var newsResponse = apiManager.getNewsBySourceId(sourceId);
    return newsResponse;
  }
}
