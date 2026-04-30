import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:news_app/features/home/drawer/selected_item.dart';
import 'divider_item.dart';
import 'drawer_item.dart';

class HomeDrawer extends StatelessWidget {
  final VoidCallback onDrawerItemClick;
  const HomeDrawer({super.key, required this.onDrawerItemClick});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(height),
          _buildHomeSection(),
          const DividerItem(),
          _buildThemeSection(),
          const DividerItem(),
          _buildLanguageSection(),
        ],
      ),
    );
  }

  Widget _buildHeader(double height) {
    return Container(
      height: height * 0.20,
      width: double.infinity,
      alignment: Alignment.center,
      color: AppColors.whiteColor,
      child: Text(
        'News App',
        style: AppStyles.medium24Black,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildHomeSection() {
    return InkWell(
      onTap: (){
        onDrawerItemClick();
      },
      child: DrawerItem(
        iconName: AppAssets.homeIcon,
        text: 'Go To Home',
      ),
    );
  }

  Widget _buildThemeSection() {
    return Column(
      children: [
        DrawerItem(
          iconName: AppAssets.themeIcon,
          text: 'Theme',
        ),
        SelectedItem(
          text: 'Dark',
          onPressed: () {
            //todo: make bottom sheet like in evently
          },
        ),
      ],
    );
  }

  Widget _buildLanguageSection() {
    return Column(
      children: [
        DrawerItem(
          iconName: AppAssets.languageIcon,
          text: 'Language',
        ),
        SelectedItem(
          text: 'English',
          onPressed: () {
            //todo: make bottom sheet like in evently
          },
        ),
      ],
    );
  }
}
