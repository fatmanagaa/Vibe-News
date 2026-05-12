import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:news_app/model/category.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/extensions/context_extensions.dart';
import '../../../providers/app_theme_provider.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final int index;

  const CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(
      builder: (context, themeProvider, _) {
        final isDarkMode = themeProvider.isDarkMode();
        final size = MediaQuery.sizeOf(context);
        final width = size.width;
        final height = size.height;
        final isEven = index.isEven;
        final titleAlignment = isEven ? Alignment.topRight : Alignment.topLeft;
        final buttonAlignment = isEven
            ? Alignment.bottomRight
            : Alignment.bottomLeft;
        final imageAlignment = isEven
            ? Alignment.centerLeft
            : Alignment.centerRight;

        return Stack(
          children: [
            SizedBox(
              height: height * 0.24,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  category.image,
                  fit: BoxFit.cover,
                  alignment: imageAlignment,
                ),
              ),
            ),
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.02,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: titleAlignment,
                        child: Text(
                          category.title,
                          maxLines: 2,
                          textAlign: isEven ? TextAlign.right : TextAlign.left,
                          style: isDarkMode
                              ? AppStyles.bold30Black
                              : AppStyles.bold30White,
                        ),
                      ),
                      Align(
                        alignment: buttonAlignment,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.greyColor,
                            borderRadius: BorderRadius.circular(84),
                          ),
                          padding: EdgeInsetsDirectional.only(
                            start: width * 0.02,
                            end: width * 0.01,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            textDirection: isEven
                                ? TextDirection.ltr
                                : TextDirection.rtl,
                            children: [
                              Text(
                                'View All',
                                style: Theme.of(context).textTheme.labelLarge
                                    ?.copyWith(color: AppColors.whiteColor),
                              ),
                              const SizedBox(width: 8),
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: Icon(
                                  isEven
                                      ? Icons.arrow_forward_ios_outlined
                                      : Icons.arrow_back_ios,
                                  color: Theme.of(context).splashColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
