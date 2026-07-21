import 'package:news_app/model/source_response.dart';

abstract class SourceStates {}

///parent class

class SourceInitialState extends SourceStates {}

class SourceLoadingState extends SourceStates {}

class SourceSuccessState extends SourceStates {
  List<Source>? sourcesList;

  SourceSuccessState(this.sourcesList);
}

class SourceErrorState extends SourceStates {
  final String errorMessage;

  SourceErrorState({required this.errorMessage});
}
