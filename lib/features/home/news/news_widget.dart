import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:news_app/model/source_response.dart';

import '../widget/main_error_widget.dart';
import '../widget/main_loading_widget.dart';
import 'news_item.dart';
import 'news_view_model.dart';

class NewsWidget extends StatefulWidget {
  final Source source;

  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  final NewsViewModel viewModel = NewsViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getNews(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            return MainErrorWidget(
              errorMsg: 'Something went wrong: ${viewModel.errorMessage}',
              onRetry: () {
                viewModel.getNews(widget.source.id ?? '');
              },
            );
          }

          if (viewModel.newsList == null) {
            return const MainLoadingWidget();
          }

          var newsList = viewModel.newsList!;
          if (newsList.isEmpty) {
            return Center(
              child: Text(
                "No Data",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            );
          }

          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              return NewsItem(news: newsList[index]);
            },
          );
        },
      ),
    );
  }
}
