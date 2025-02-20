import 'package:eslami/core/constant/app_assets.dart';
import 'package:eslami/core/theme/app_colors.dart';
import 'package:eslami/screens/layout/hadith/hadith_screen.dart';
import 'package:eslami/screens/layout/pray_time/prayTime_screen.dart';
import 'package:eslami/screens/layout/quran/Quran_screen.dart';
import 'package:eslami/screens/layout/radio/radio_screen.dart';
import 'package:eslami/screens/layout/sepha/sepha_screen.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = 'LayoutScreen';

  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  List <Widget> screens = [
    QuranScreen(),
    HadithScreen(),
    SephaScreen(),
    RadioScreen(),
    PrayTimeScreen()

  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.coffee,
            fixedColor: AppColors.white,
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: IconThemeData(color: AppColors.white),
            showUnselectedLabels: false,
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            currentIndex: currentIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(66),
                          color: currentIndex == 0
                              ? AppColors.dark.withOpacity(0.6)
                              : Colors.transparent),
                      child: ImageIcon(AssetImage(AppAssets.quranIcon))),
                  label: 'quran'),
              BottomNavigationBarItem(
                  icon: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(66),
                          color: currentIndex == 1
                              ? AppColors.dark.withOpacity(0.6)
                              : Colors.transparent),
                      child: ImageIcon(AssetImage(AppAssets.hadithIcon))),
                  label: 'hadith'),
              BottomNavigationBarItem(
                  icon: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(66),
                          color: currentIndex == 2
                              ? AppColors.dark.withOpacity(0.6)
                              : Colors.transparent),
                      child: ImageIcon(AssetImage(AppAssets.sephaIcon))),
                  label: 'sepha'),
              BottomNavigationBarItem(
                  icon: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(66),
                          color: currentIndex == 3
                              ? AppColors.dark.withOpacity(0.6)
                              : Colors.transparent),
                      child: ImageIcon(AssetImage(AppAssets.radioIcon))),
                  label: 'radio'),
              BottomNavigationBarItem(
                  icon: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(66),
                          color: currentIndex == 4
                              ? AppColors.dark.withOpacity(0.6)
                              : Colors.transparent),
                      child: ImageIcon(AssetImage(AppAssets.timeIcon))),
                  label: 'time'),
            ]),
        body: screens[currentIndex],
      ),
    );
  }
}
