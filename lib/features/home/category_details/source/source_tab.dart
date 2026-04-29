import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../model/source_response.dart';

class SourceTab extends StatelessWidget {
  final Source source;
  bool isSelected;

  SourceTab({super.key, required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(
      source.name ?? '',
      style: isSelected ? AppStyles.bold16White : AppStyles.medium14White,
    );
  }
}
