// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../api/api_manger.dart' as _i339;
import '../data/repository/news/data_source/remote/implementation/news_remote_data_source_impl.dart'
    as _i738;
import '../data/repository/news/data_source/remote/news_remote_data_source.dart'
    as _i319;
import '../data/repository/news/repository/implementation/news_repository_impl.dart'
    as _i1020;
import '../data/repository/news/repository/news_repository.dart' as _i912;
import '../data/repository/sources/data_sources/remote/implementation/source_remote_data_source_impl.dart'
    as _i882;
import '../data/repository/sources/data_sources/remote/source_remote_data_source.dart'
    as _i567;
import '../data/repository/sources/repository/implementation/source_repository_impl.dart'
    as _i375;
import '../data/repository/sources/repository/source_repository.dart' as _i522;
import '../features/home/category_details/cubit/source_view_model.mvvm.bloc.dart'
    as _i26;
import '../features/home/news/cubit/news_view_model_cubit.dart' as _i953;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i339.ApiManger>(() => _i339.ApiManger());
    gh.factory<_i319.NewsRemoteDataSource>(
      () => _i738.NewsRemoteDataSourceImpl(apiManager: gh<_i339.ApiManger>()),
    );
    gh.factory<_i912.NewsRepository>(
      () => _i1020.NewsRepositoryImpl(
        newsRemoteDataSource: gh<_i319.NewsRemoteDataSource>(),
      ),
    );
    gh.factory<_i567.SourceRemoteDataSource>(
      () => _i882.SourceRemoteDataSourceImpl(apiManager: gh<_i339.ApiManger>()),
    );
    gh.factory<_i953.NewsViewModelCubit>(
      () =>
          _i953.NewsViewModelCubit(newsRepository: gh<_i912.NewsRepository>()),
    );
    gh.factory<_i522.SourceRepository>(
      () => _i375.SourceRepositoryImpl(
        sourceRemoteDataSource: gh<_i567.SourceRemoteDataSource>(),
      ),
    );
    gh.factory<_i26.SourceViewModel>(
      () =>
          _i26.SourceViewModel(sourceRepository: gh<_i522.SourceRepository>()),
    );
    return this;
  }
}
