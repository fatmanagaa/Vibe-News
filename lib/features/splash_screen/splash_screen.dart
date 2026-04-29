import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_routes.dart';

import '../../core/utils/app_assets.dart';
import '../../core/utils/extensions/context_extensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        context.pushReplacementNamed(AppRoutes.homeScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: Image.asset(AppAssets.getLogoPhoto(context))),
          ],
        ),
      ),
    );
  }
}
