import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:news_app/model/news_response.dart';
import '../../../core/utils/extensions/context_extensions.dart';
import '../../../model/news_response.dart';
import '../widget/main_loading_widget.dart';

class NewsItem extends StatelessWidget {
  final News news;

  const NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.01,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).splashColor, width: 2),
      ),
      child: Column(
        spacing: height * 0.02,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => MainLoadingWidget(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(
            news.title ?? '',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'By${news.author ?? ''}',
                  style: AppStyles.medium12grey,
                ),
              ),
              Text(news.publishedAt ?? '', style: AppStyles.medium12grey),
            ],
          ),
        ],
      ),
    );
  }
}
