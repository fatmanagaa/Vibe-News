import 'package:flutter/material.dart';

class AppAssets {
  static String getLogoPhoto(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? 'assets/images/logos/news_logo.png'
        : 'assets/images/logos/Light Logo.png';
  }

  static const String homeIcon = 'assets/images/icons/Home 1.png';
  static const String languageIcon = 'assets/images/icons/laungauge.png';
  static const String themeIcon = 'assets/images/icons/theme.png';

  static String getCategoryImageGeneral(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? 'assets/images/dark_mode/general.png'
        : 'assets/images/light_mode/general_dark.png';
  }

  static String getCategoryImageBusiness(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? 'assets/images/dark_mode/busniess.png'
        : 'assets/images/light_mode/busniess_dark.png';
  }

  static String getCategoryImageHealth(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? 'assets/images/dark_mode/helth.png'
        : 'assets/images/light_mode/helth_dark.png';
  }

  static String getCategoryImageEntertainment(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? 'assets/images/dark_mode/entertainment (1).png'
        : 'assets/images/light_mode/entertainment_dark (1).png';
  }

  static String getCategoryImageScience(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? 'assets/images/dark_mode/science.png'
        : 'assets/images/light_mode/science_dark.png';
  }

  static String getCategoryImageSport(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? 'assets/images/dark_mode/sport.png'
        : 'assets/images/light_mode/sport_dark.png';
  }

  static String getCategoryImageTech(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? 'assets/images/dark_mode/technology.png'
        : 'assets/images/light_mode/technology_dark.png';
  }
}
