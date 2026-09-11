import 'package:news_app/model/source_response.dart';
import '../source_local_data_source.dart';

class SourceLocalDataSourceImplementation implements SourceLocalDataSource {
  @override
  Future<SourceResponse> getSources(String categoryId) {
    // TODO: implement getSources
    throw UnimplementedError();
  }

  @override
  void saveSources(SourceResponse sourceResponse) {
    // TODO: implement saveSources
    throw UnimplementedError();
  }
}