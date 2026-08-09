import 'package:news_app/api/api_manger.dart';

import '../../../../../../model/news_response.dart';
import '../news_remote_data_source.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManger apiManger;
  NewsRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) {
    var newsResponse=apiManger.getNewsBySourceId(sourceId);
    return newsResponse;
  }
}