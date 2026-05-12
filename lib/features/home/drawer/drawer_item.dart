import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_styles.dart';

class DrawerItem extends StatelessWidget {
  final String iconName;
  final String text;
  final bool isDarkMode;

  const DrawerItem({
    super.key,
    required this.iconName,
    required this.text,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final iconSize = width * 0.08; // Responsive size (approximately 30px on standard devices)

    final textStyle = isDarkMode
        ? AppStyles.medium20White
        : AppStyles.medium20Black;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: width * 0.03,
      ),
      child: Row(
        spacing: width * 0.04,
        children: [
          SizedBox(
            width: iconSize,
            height: iconSize,
            child: Image.asset(iconName),
          ),
          Text(
            text,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
