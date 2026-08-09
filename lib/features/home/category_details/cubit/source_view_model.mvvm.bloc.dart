import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repository/sources/data_sources/remote/implementation/source_remote_data_source_impl.dart';
import 'package:news_app/data/repository/sources/data_sources/remote/source_remote_data_source.dart';
import 'package:news_app/data/repository/sources/repository/implementation/source_repository_impl.dart';
import 'package:news_app/data/repository/sources/repository/source_repository.dart';
import 'package:news_app/features/home/category_details/cubit/source_states.dart';

import '../../../../api/api_manger.dart';

class SourceViewModel extends Cubit<SourceStates> {
  late SourceRepository sourceRepository;
  late SourceRemoteDataSource sourceRemoteDataSource;
  late ApiManger apiManger;
  SourceViewModel() : super(SourceLoadingState()){
    apiManger=ApiManger();
    sourceRemoteDataSource=SourceRemoteDataSourceImpl(apiManager: apiManger);
    sourceRepository =SourceRepositoryImpl(sourceRemoteDataSource: sourceRemoteDataSource);
  }


  ///handle logic , hold data
  ///but in this case data holded in states class
  void getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());

      var response = await sourceRepository.getSources(categoryId);

      if (response.status == 'error') {
        emit(SourceErrorState(errorMessage: response.message!));
        return;
      }

      if (response.status == 'ok') {
        emit(SourceSuccessState(response.sources));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}