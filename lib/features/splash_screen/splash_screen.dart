import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_routes.dart';
import 'package:provider/provider.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/extensions/context_extensions.dart';
import '../../providers/app_theme_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 7), () {
      if (mounted) {
        context.pushReplacementNamed(AppRoutes.homeScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(
      builder: (context, themeProvider, _) {
        final isDarkMode = themeProvider.isDarkMode();
        final splashImage = isDarkMode
            ? 'assets/images/logos/dark_logo.png'
            : 'assets/images/logos/Light Logo.png';

        return Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Image.asset(splashImage)),
              ],
            ),
          ),
        );
      },
    );
  }
}
