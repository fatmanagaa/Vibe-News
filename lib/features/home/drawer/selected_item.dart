import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_styles.dart';

class SelectedItem extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isDarkMode;

  const SelectedItem({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final textColor = isDarkMode ? AppColors.whiteColor : AppColors.blackColor;
    final borderColor = isDarkMode ? AppColors.whiteColor : AppColors.blackColor;
    final textStyle = isDarkMode
        ? AppStyles.medium20White
        : AppStyles.medium20Black;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.015,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: textStyle,
          ),
          GestureDetector(
            onTap: onPressed,
            child: Icon(
              Icons.arrow_drop_down,
              size: 24,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
