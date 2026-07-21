import 'package:flutter/material.dart';
import 'package:news_app/features/home/category_details/source/source_tab.dart';
import 'package:news_app/features/home/news/cubit/news_widget_by_cubit.dart';
import 'package:news_app/model/source_response.dart';

import '../../news/news_widget.dart';

class SourceWidget extends StatefulWidget {
  final List<Source> sourcesList;

  SourceWidget({super.key, required this.sourcesList});

  @override
  State<SourceWidget> createState() => _SourceWidgetState();
}

class _SourceWidgetState extends State<SourceWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            dividerColor: Colors.transparent,
            onTap: (index) {
              selectedIndex = index;
              setState(() {

              });
            },
            tabAlignment: TabAlignment.start,
            indicatorColor: Theme.of(context).splashColor,
            tabs: widget.sourcesList.map((source) {
              return SourceTab(
                source: source,
                isSelected: selectedIndex == widget.sourcesList.indexOf(source),
              );
            }).toList(),
          ),
          Expanded(child: NewsWidgetByCubit(source: widget.sourcesList[selectedIndex]))



        ],
      ),
    );
  }
}
