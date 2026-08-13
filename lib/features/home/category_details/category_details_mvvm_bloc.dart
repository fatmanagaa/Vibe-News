import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/category_details/source/source_widget.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/source_response.dart';
import '../../../di/di.dart';
import '../widget/main_loading_widget.dart';
import 'cubit/source_states.dart';
import 'cubit/source_view_model.mvvm.bloc.dart';

class CategoryDetailsMvvmBloc extends StatefulWidget {
  final Category category;

  const CategoryDetailsMvvmBloc({super.key, required this.category});

  @override
  State<CategoryDetailsMvvmBloc> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetailsMvvmBloc> {
  SourceViewModel viewModel = SourceViewModel(sourceRepository: injectSourceRepository());

  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SourceViewModel>(
      create: (context) => viewModel,
      child: BlocBuilder<SourceViewModel, SourceStates>(
        builder: (context, state) {
          // Loading
          if (state is SourceLoadingState) {
            return const MainLoadingWidget();
          }
          // Error
          else if (state is SourceErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Something went wrong: ${state.errorMessage}',
                    style: Theme.of(context).textTheme.labelLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.getSources(widget.category.id);
                    },
                    child: Text(
                      'Try Again',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).splashColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          // Success
          else if (state is SourceSuccessState) {
            List<Source> sourcesList = state.sourcesList ?? [];
      
            if (sourcesList.isEmpty) {
              return Center(
                child: Text(
                  "No Data",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              );
            }
      
            return SourceWidget(sourcesList: sourcesList);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
