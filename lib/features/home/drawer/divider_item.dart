import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';

class DividerItem extends StatelessWidget {
  const DividerItem({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.02),
      child: Divider(
        color: AppColors.whiteColor,
        thickness: 1,
        indent: width * 0.04,
        endIndent: width * 0.04,
      ),
    );
  }
}
