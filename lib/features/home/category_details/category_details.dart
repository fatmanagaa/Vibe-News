import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:news_app/features/home/category_details/source/source_widget.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/model/source_response.dart';
import '../../../api/api_manger.dart';
import '../widget/main_loading_widget.dart';

class CategoryDetails extends StatefulWidget {

  final Category category;

  const CategoryDetails({super.key,  required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  late Future<SourceResponse> _sourcesFuture;

  @override
  void initState() {
    super.initState();
    _fetchSources();
  }

  void _fetchSources() {
    _sourcesFuture = ApiManger.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<SourceResponse>(
      future: _sourcesFuture,
      builder: (context, snapshot) {
        // Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainLoadingWidget();
        }
        // Network Error / Connection failed
        else if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Something went wrong: ${snapshot.error}',
                  style: AppStyles.bold16Black,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _fetchSources();
                    });
                  },
                  child: Text('Try Again', style: AppStyles.bold16White),
                ),
              ],
            ),
          );
        }
        // Api Response Arrived
        else if (snapshot.hasData) {
          // API Error (status not ok)
          if (snapshot.data!.status != 'ok') {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    snapshot.data!.message ?? 'API Error',
                    style: AppStyles.bold16Black,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _fetchSources();
                      });
                    },
                    child: Text('Try Again', style: AppStyles.bold16White),
                  ),
                ],
              ),
            );
          }

          // Success
          List<Source>? sourcesList = snapshot.data!.sources ?? [];

          if (sourcesList.isEmpty) {
            return Center(
              child: Text(
                "No Data",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            );
          }

          return SourceWidget(sourcesList: sourcesList);
        }

        // Fallback
        return Center(
          child: Text(
            "No Data",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        );
      },
    );
  }
}
