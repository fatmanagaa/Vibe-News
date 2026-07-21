 import '../../../../model/news_response.dart';

abstract class NewsStates {}
 class NewsLoadingState extends NewsStates {}
 class NewsSuccessState extends NewsStates {
   List<News>? newsList;

   NewsSuccessState(this.newsList);
}
 class NewsErrorState extends NewsStates {
   final String errorMessage;

   NewsErrorState({required this.errorMessage});
 }