import 'package:bloc/bloc.dart';
import 'package:news_app/features/home/news/cubit/news_states.dart';

import '../../../../api/api_manger.dart';

class NewsViewModelCubit extends Cubit<NewsStates> {
  NewsViewModelCubit():super(NewsLoadingState());
void getNewsBySourceId(String sourceId) async {
    try {
      emit(NewsLoadingState());

      var response = await ApiManger.getNewsBySourceId(sourceId);

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