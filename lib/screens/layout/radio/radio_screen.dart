import 'package:flutter/material.dart';

import '../../../core/constant/app_assets.dart';

class RadioScreen extends StatelessWidget {
  static const String routeName = 'RadioScreen';
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.radioBg), fit: BoxFit.cover,),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xb3202020),
              Color(0xff202020),
            ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(child: Image.asset(AppAssets.islamiMosquelogo)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
