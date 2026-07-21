import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/category_details/cubit/source_states.dart';

import '../../../../api/api_manger.dart';

class SourceViewModel extends Cubit<SourceStates> {
  SourceViewModel() : super(SourceLoadingState());
///handle logic , hold data
  ///but in this case data holded in states class
  void getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());

      var response = await ApiManger.getSources(categoryId);

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