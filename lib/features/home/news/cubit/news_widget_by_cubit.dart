import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/news/cubit/news_view_model_cubit.dart';
import 'package:news_app/features/home/news/news_item.dart';
import 'package:news_app/model/source_response.dart';

import '../../widget/main_error_widget.dart';
import '../../widget/main_loading_widget.dart';
import 'news_states.dart';

class NewsWidgetByCubit extends StatefulWidget {
  final Source source;

  const NewsWidgetByCubit({super.key, required this.source});

  @override
  State<NewsWidgetByCubit> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidgetByCubit> {
  final NewsViewModelCubit viewModel = NewsViewModelCubit();

  @override
  void initState() {
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsViewModelCubit>(
      create: (context) => viewModel,
      child: BlocBuilder<NewsViewModelCubit, NewsStates>(
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return const MainLoadingWidget();
          } else if (state is NewsErrorState) {
            return MainErrorWidget(
              errorMsg: 'Something went wrong: ${state.errorMessage}',
              onRetry: () {
                viewModel.getNewsBySourceId(widget.source.id ?? '');
              },
            );
          } else if (state is NewsSuccessState) {
            var newsList = state.newsList;
            if (newsList == null || newsList.isEmpty) {
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
          }
          return Container();
        },
      ),
    );
  }
}
