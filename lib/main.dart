import 'package:eslami/core/theme/app_colors.dart';
import 'package:eslami/screens/layout/hadith/hadith_screen.dart';
import 'package:eslami/screens/layout/layout_screen.dart';
import 'package:eslami/screens/layout/quran/Quran_screen.dart';
import 'package:eslami/screens/layout/quran/sura_details.dart';
import 'package:eslami/screens/layout/sepha/sepha_screen.dart';
import 'package:eslami/screens/pageview/Initial_pages.dart';
import 'package:eslami/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: <String ,WidgetBuilder>{
        SplashScreen.routeName : (context)=> SplashScreen(),
        InitialPages.routeName  : (context)=> InitialPages(),
        LayoutScreen.routeName : (context)=> LayoutScreen(),
        HadithScreen.routeName : (context)=> HadithScreen(),
        QuranScreen.routeName : (context)=> QuranScreen(),
        SephaScreen.routeName : (context)=> SephaScreen(),
        SuraDetails.routeName : (context)=> SuraDetails(index: 0,),
      }
    );
  }
}
