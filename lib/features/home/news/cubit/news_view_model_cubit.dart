import 'package:bloc/bloc.dart';
import 'package:news_app/data/repository/news/data_source/remote/news_remote_data_source.dart';
import 'package:news_app/data/repository/news/repository/news_repository.dart';
import 'package:news_app/features/home/news/cubit/news_states.dart';

import '../../../../api/api_manger.dart';
import '../../../../data/repository/news/data_source/remote/implementation/news_remote_data_source_impl.dart';
import '../../../../data/repository/news/repository/implementation/news_repository_impl.dart';

class NewsViewModelCubit extends Cubit<NewsStates> {
   NewsRepository newsRepository;

  NewsViewModelCubit({required this.newsRepository}) : super(NewsLoadingState());

  void getNewsBySourceId(String sourceId) async {
    try {
      emit(NewsLoadingState());

      var response = await newsRepository.getNewsBySourceId(sourceId);

      if (response.status == 'error') {
        emit(NewsErrorState(errorMessage: response.message!));
        return;
      }

      if (response.status == 'ok') {
        emit(NewsSuccessState(response.articles));
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}
