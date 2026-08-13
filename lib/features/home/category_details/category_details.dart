import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/data/repository/sources/data_sources/remote/implementation/source_remote_data_source_impl.dart';
import 'package:news_app/data/repository/sources/repository/implementation/source_repository_impl.dart';
import 'package:news_app/features/home/category_details/source/source_view_model.dart';
import 'package:news_app/features/home/category_details/source/source_widget.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/source_response.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/app_colors.dart';
import '../widget/main_loading_widget.dart';

class CategoryDetails extends StatefulWidget {
  final Category category;

  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final SourceViewModel viewModel = SourceViewModel(
    repository: SourceRepositoryImpl(
      sourceRemoteDataSource: SourceRemoteDataSourceImpl(
        apiManager: ApiManger(),
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SourceViewModel>(
        builder: (context, viewModel, child) {
          // Loading
          if (viewModel.sourcesList == null && viewModel.errorMessage == null) {
            return const MainLoadingWidget();
          }
          // Error
          else if (viewModel.errorMessage != null) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Text(
                          'Something went wrong: ${viewModel.errorMessage}',
                          style: Theme.of(context).textTheme.labelLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.getSources(widget.category.id);
                      },
                      child: Text(
                        'Try Again',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: AppColors.whiteColor,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          // Success
          else {
            List<Source> sourcesList = viewModel.sourcesList ?? [];

            if (sourcesList.isEmpty) {
              return Center(
                child: Text(
                  "No Data",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              );
            }

            return SourceWidget(sourcesList: viewModel.sourcesList!);
          }
        },
      ),
    );
  }
}
