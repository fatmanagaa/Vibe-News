// import '../api/api_manger.dart';
// import '../data/repository/news/data_source/remote/implementation/news_remote_data_source_impl.dart';
// import '../data/repository/news/data_source/remote/news_remote_data_source.dart';
// import '../data/repository/news/repository/implementation/news_repository_impl.dart';
// import '../data/repository/news/repository/news_repository.dart';
// import '../data/repository/sources/data_sources/remote/implementation/source_remote_data_source_impl.dart';
// import '../data/repository/sources/data_sources/remote/source_remote_data_source.dart';
// import '../data/repository/sources/repository/implementation/source_repository_impl.dart';
// import '../data/repository/sources/repository/source_repository.dart';
//
// ApiManger injectApiManager() {
//   return ApiManger();
// }
//
// SourceRemoteDataSource injectSourceRemoteDataSource() {
//   return SourceRemoteDataSourceImpl(apiManager: injectApiManager());
// }
//
// SourceRepository injectSourceRepository() {
//   return SourceRepositoryImpl(
//     sourceRemoteDataSource: injectSourceRemoteDataSource(),
//   );
// }
//
// NewsRemoteDataSource injectNewsRemoteDataSource() {
//   return NewsRemoteDataSourceImpl(apiManger: injectApiManager());
// }
//
// NewsRepository injectNewsRepository() {
//   return NewsRepositoryImpl(newsRemoteDataSource: injectNewsRemoteDataSource());
// }
