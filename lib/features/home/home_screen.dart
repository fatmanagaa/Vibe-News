import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_styles.dart';
import 'package:news_app/model/category.dart';
import 'category_details/category_details.dart';
import 'category_fragment/category_fragment.dart';
import 'drawer/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style:  Theme.of(context).textTheme.headlineLarge,),
        centerTitle: true,
      ),
      drawer: Drawer(backgroundColor: AppColors.blackColor,
          child: HomeDrawer()),
      body: CategoryFragment(onCategoryItemClick: onCategoryItemClick ),
    );
  }
  void onCategoryItemClick(Category category) {

  }

}
