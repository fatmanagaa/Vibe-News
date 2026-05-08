import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:news_app/model/category.dart';
import 'package:provider/provider.dart';
import '../../providers/app_language_provider.dart';
import '../../providers/app_theme_provider.dart';
import 'category_details/category_details.dart';
import 'category_fragment/category_fragment.dart';
import 'drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category? selectedCategory;

  @override
  Widget build(BuildContext context) {
    var appLanguageProvider = Provider.of<AppLanguageProvider>(context);
    var appThemeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null ? 'Home' : selectedCategory!.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: appThemeProvider.isDarkMode()
            ? AppColors.blackColor
            : AppColors.whiteColor,
        child: HomeDrawer(onDrawerItemClick: onDrawerItemClick),
      ),
      body: selectedCategory == null
          ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
          : CategoryDetails(category: selectedCategory!),
    );
  }

  void onCategoryItemClick(Category newSelectedCategory) {
    //todo:newSelectedCategory=>UserChoice
    setState(() {
      selectedCategory = newSelectedCategory;
    });
  }

  void onDrawerItemClick() {
    Navigator.pop(context);
    setState(() {
      selectedCategory = null;
    });
  }
}
