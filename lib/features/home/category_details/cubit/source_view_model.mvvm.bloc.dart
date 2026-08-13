import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/repository/sources/repository/source_repository.dart';
import 'package:news_app/features/home/category_details/cubit/source_states.dart';

class SourceViewModel extends Cubit<SourceStates> {
  final SourceRepository sourceRepository;

  SourceViewModel({required this.sourceRepository}) : super(SourceLoadingState());

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
