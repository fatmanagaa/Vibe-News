import 'package:flutter/material.dart';
import 'package:news_app/api/dio/dio_manager.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/model/source_response.dart';

import '../widget/main_error_widget.dart';
import '../widget/main_loading_widget.dart';
import 'news_item.dart';

class NewsWidget extends StatefulWidget {
  final Source source;

  const NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: DioManager().getNewsBySourceId(widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MainLoadingWidget();
        } else if (snapshot.hasError) {
          return MainErrorWidget(
            errorMsg: 'Something went wrong',
            onRetry: () {
              setState(() {});
            },
          );
        }
        //todo:server=>response=>error,success
        if (snapshot.data?.status == 'error') {
          return MainErrorWidget(
            errorMsg: snapshot.data!.message!,
            onRetry: () {
              setState(() {});
            },
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        if (newsList.isEmpty) {
          return Center(
            child: Text(
              "No Data",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          );
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: newsList[index]);
            },
            itemCount: newsList.length,
          );
        }
      },
    );
  }
}
