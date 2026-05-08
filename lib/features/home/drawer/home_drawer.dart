import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:news_app/features/home/drawer/selected_item.dart';
import 'package:provider/provider.dart';
import '../../../providers/app_theme_provider.dart';
import 'divider_item.dart';
import 'drawer_item.dart';

class HomeDrawer extends StatelessWidget {
  final VoidCallback onDrawerItemClick;
  const HomeDrawer({super.key, required this.onDrawerItemClick});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(
      builder: (context, themeProvider, _) {
        final height = MediaQuery.of(context).size.height;
        final isDarkMode = themeProvider.isDarkMode();
        
        return SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(height, isDarkMode),
              _buildHomeSection(isDarkMode),
              DividerItem(isDarkMode: isDarkMode),
              _buildThemeSection(isDarkMode),
              DividerItem(isDarkMode: isDarkMode),
              _buildLanguageSection(isDarkMode),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(double height, bool isDarkMode) {
    return Container(
      height: height * 0.20,
      width: double.infinity,
      alignment: Alignment.center,
      color: isDarkMode ? AppColors.blackColor : AppColors.whiteColor,
      child: Text(
        'News App',
        style: isDarkMode ? AppStyles.medium24White : AppStyles.medium24Black,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildHomeSection(bool isDarkMode) {
    return InkWell(
      onTap: (){
        onDrawerItemClick();
      },
      child: DrawerItem(
        iconName: AppAssets.homeIcon,
        text: 'Go To Home',
        isDarkMode: isDarkMode,
      ),
    );
  }

  Widget _buildThemeSection(bool isDarkMode) {
    return Consumer<AppThemeProvider>(
      builder: (context, themeProvider, _) {
        final currentTheme = isDarkMode ? 'Dark' : 'Light';
        return Column(
          children: [
            DrawerItem(
              iconName: AppAssets.themeIcon,
              text: 'Theme',
              isDarkMode: isDarkMode,
            ),
            SelectedItem(
              text: currentTheme,
              isDarkMode: isDarkMode,
              onPressed: () {
                _showThemeBottomSheet(context, themeProvider, isDarkMode);
              },
            ),
          ],
        );
      },
    );
  }

  void _showThemeBottomSheet(
    BuildContext context,
    AppThemeProvider themeProvider,
    bool isDarkMode,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: isDarkMode ? AppColors.blackColor : AppColors.whiteColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Select Theme',
                  style: isDarkMode
                      ? AppStyles.bold30White
                      : AppStyles.bold30Black,
                ),
                const SizedBox(height: 24),
                _buildThemeOption(
                  context,
                  'Dark Mode',
                  ThemeMode.dark,
                  themeProvider,
                  isDarkMode,
                ),
                const SizedBox(height: 16),
                _buildThemeOption(
                  context,
                  'Light Mode',
                  ThemeMode.light,
                  themeProvider,
                  isDarkMode,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildThemeOption(
    BuildContext context,
    String themeName,
    ThemeMode themeMode,
    AppThemeProvider themeProvider,
    bool isDarkMode,
  ) {
    final isSelected = (themeMode == ThemeMode.dark && isDarkMode) ||
        (themeMode == ThemeMode.light && !isDarkMode);

    return GestureDetector(
      onTap: () {
        themeProvider.changeTheme(themeMode);
        Navigator.pop(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? (isDarkMode ? AppColors.whiteColor : AppColors.blackColor)
                : Colors.grey,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              themeName,
              style: isSelected
                  ? (isDarkMode
                      ? AppStyles.bold16White
                      : AppStyles.bold16Black)
                  : (isDarkMode
                      ? AppStyles.medium14White
                      : AppStyles.medium14Black),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: isDarkMode ? AppColors.whiteColor : AppColors.blackColor,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageSection(bool isDarkMode) {
    return Column(
      children: [
        DrawerItem(
          iconName: AppAssets.languageIcon,
          text: 'Language',
          isDarkMode: isDarkMode,
        ),
        SelectedItem(
          text: 'English',
          isDarkMode: isDarkMode,
          onPressed: () {
            //todo: make bottom sheet like in evently
          },
        ),
      ],
    );
  }
}
