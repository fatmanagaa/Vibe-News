//todo: repository implementation implements Repository
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/data/repository/sources/data_sources/local/source_local_data_source.dart';
import 'package:news_app/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:news_app/model/source_response.dart';

import '../source_repository.dart';
@Injectable(as: SourceRepository)
class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource remoteDataSource;
  SourceLocalDataSource localDataSource;

  SourceRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<SourceResponse> getSources(String categoryId) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      //todo: internet => online => remote ds
      var sourceResponse = await remoteDataSource.getSources(categoryId);
      //todo: save sources
      localDataSource.saveSources(sourceResponse);
      return sourceResponse;
    } else {
      //todo: no internet => offline => local ds
      var sourceResponse = await localDataSource.getSources(categoryId);
      return sourceResponse;
    }
  }
}