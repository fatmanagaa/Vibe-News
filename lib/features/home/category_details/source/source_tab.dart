import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../model/source_response.dart';
import '../../../../providers/app_theme_provider.dart';

class SourceTab extends StatelessWidget {
  final Source source;
  bool isSelected;

  SourceTab({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(
      builder: (context, themeProvider, _) {
        final isDarkMode = themeProvider.isDarkMode();

        final style = isSelected
            ? (isDarkMode ? AppStyles.bold16White : AppStyles.bold16Black)
            : (isDarkMode ? AppStyles.medium14White : AppStyles.medium14Black);

        return Text(
          source.name ?? '',
          style: style,
        );
      },
    );
  }
}
