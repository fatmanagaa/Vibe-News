import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';

class DividerItem extends StatelessWidget {
  final bool isDarkMode;

  const DividerItem({super.key, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final dividerColor = isDarkMode ? AppColors.whiteColor : AppColors.blackColor;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.02),
      child: Divider(
        color: dividerColor,
        thickness: 1,
        indent: width * 0.04,
        endIndent: width * 0.04,
      ),
    );
  }
}
