import 'package:eslami/core/constant/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';

class SephaScreen extends StatefulWidget {
  static const String routeName = 'SephaScreen';

  const SephaScreen({super.key});

  @override
  State<SephaScreen> createState() => _SephaScreenState();
}

class _SephaScreenState extends State<SephaScreen> {
  int clickCount = 0;
  int index = 0;
  List<String> azkar = [ "الله اكبر",'الحمدلله' , 'سبحان الله'];
  double turns = 0.0;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.sebhaBg), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xb3202020),
              Color(0xff202020),
            ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Center(child: Image.asset(AppAssets.islamiMosquelogo)),
                ),
                Text(
                  'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
                  style: TextStyle(color: AppColors.white, fontSize: 30),
                ),
                Spacer(),
                Image.asset(AppAssets.sebhaHead,height: 60,),
                Stack(
                  fit: StackFit.loose,
                  alignment: Alignment.center,
                  children: [
                      AnimatedRotation(
                        turns: turns,
                        duration: Duration(microseconds: 300),
                        child: Image.asset(
                        AppAssets.sebhaBody,
                        fit: BoxFit.cover,
                                              ),
                    ),
                    InkWell(
                      onTap: () {
                        counter();
                      },
                      child: Column(
                        children: [
                          Text(
                             azkar[index],
                            style:
                                TextStyle(color: AppColors.white, fontSize: 30),
                          ),
                          SizedBox(height: 15,),
                          Text(
                            '$clickCount',
                            style:
                                TextStyle(color: AppColors.white, fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void counter() {
    setState(() {
      clickCount++;
      turns += 1 / 35;
      if (clickCount % 33 == 0) {
        index = (index + 1) % azkar.length;
        clickCount = 0;
      }
    });
  }
}
