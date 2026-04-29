import 'package:flutter/material.dart';

import '../../../core/utils/app_styles.dart';

class MainErrorWidget extends StatelessWidget {
  final String errorMsg;
  final VoidCallback onRetry;


   MainErrorWidget({super.key, required this.errorMsg, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          errorMsg,
          style: AppStyles.bold16Black,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
          onRetry;
          },
          child: Text(
            'Try Again',
            style: AppStyles.bold16White,
          ),
        ),
      ],
    );
  }
}
