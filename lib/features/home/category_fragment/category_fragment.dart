import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:news_app/model/category.dart';
import '../../../core/utils/extensions/context_extensions.dart';
import 'category_item.dart';

typedef OnCategoryItemClick = void Function(Category category);

class CategoryFragment extends StatelessWidget {
  final List<Category>? categoriesList;
  final OnCategoryItemClick onCategoryItemClick;

  const CategoryFragment({
    super.key,
    required this.onCategoryItemClick,
    this.categoriesList,
  });

  @override
  Widget build(BuildContext context) {
    final width = context.width;
    final height = context.height;
    final isDarkMode = context.isDark;
    final categoriesList = Category.getCategoriesList(context);
    final titleStyle = isDarkMode
        ? AppStyles.medium24Black
        : AppStyles.medium24White;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Column(
          spacing: height * 0.02,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning \n Here is Some News For You',
              style: titleStyle,
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    //todo: navigate to category details By Using Call Back Function
                    onCategoryItemClick(categoriesList[index]);
                  },
                  child: CategoryItem(
                    category: categoriesList[index],
                    index: index,
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(height: height * 0.02),
              itemCount: categoriesList.length,
            ),
          ],
        ),
      ),
    );
  }
}
