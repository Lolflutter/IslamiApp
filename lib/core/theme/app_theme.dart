import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.coffee,
    primaryColorDark: AppColors.dark,
    primaryColorLight: AppColors.white,
    scaffoldBackgroundColor: AppColors.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.coffee,
      titleTextStyle: TextStyle(color:AppColors.coffee ,  fontWeight: FontWeight.w700 ),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      bodyLarge:TextStyle(
        color: AppColors.coffee,
        fontSize: 20,
      ),
      bodyMedium: TextStyle(
        color: AppColors.coffee,
        fontSize: 18,
      ),
      bodySmall: TextStyle(
        color: AppColors.coffee,
        fontSize: 14,
      ),
    ),


  );
}