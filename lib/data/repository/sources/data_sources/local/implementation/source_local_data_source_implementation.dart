import 'package:hive_ce/hive.dart';
import 'package:news_app/model/source_response.dart';
import '../source_local_data_source.dart';

class SourceLocalDataSourceImplementation implements SourceLocalDataSource {
  @override
  Future<SourceResponse> getSources(String categoryId) async {
    var box = await Hive.openBox('Sources');
    var data = box.get('sourceTab');
    return data;
  }

  @override
  Future<void> saveSources(SourceResponse sourceResponse) async {
    var box = await Hive.openBox('Sources');
    await box.put('sourceTab', sourceResponse);
    await box.close();
  }
}
