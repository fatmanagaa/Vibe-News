import 'package:news_app/api/api_manger.dart';
import 'package:news_app/model/source_response.dart';
import '../source_remote_data_source.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  final ApiManger apiManager;

  SourceRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<SourceResponse> getSources(String categoryId) async {
    var response = await apiManager.getSources(categoryId);
    return response;
  }
}
