import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/providers/app_language_provider.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:provider/provider.dart';

import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
import 'features/home/home_screen.dart';
import 'features/splash_screen/splash_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppThemeProvider()),
        ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var appLanguageProvider = Provider.of<AppLanguageProvider>(context);
    var appThemeProvider = Provider.of<AppThemeProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(400, 750),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splashScreen,
        routes: {
          AppRoutes.splashScreen: (context) => SplashScreen(),
          AppRoutes.homeScreen: (context) => HomeScreen(),
        },
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode:appThemeProvider.appTheme,
      ),
    );
  }
}
