import 'package:flutter/material.dart';
import 'package:flutter_toolkit/resources/app_colors.dart';
import 'package:flutter_toolkit/resources/app_strings.dart';
import 'package:flutter_toolkit/resources/app_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  static double preferredHeight = 60;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      automaticallyImplyLeading: false,
      title: Hero(
        tag: 'logoHero',
        child: Text(
          AppStrings.appBarTitle,
          style: AppStyles.getTitleStyle(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
