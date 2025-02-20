import 'package:eslami/screens/layout/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../hadith_model.dart';

class HadithDetails extends StatelessWidget {
  static const String routeName = 'HadithDetails';

  HadithDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var arg = ModalRoute.of(context)!.settings.arguments as HadithModel;
    return Scaffold(
        backgroundColor: AppColors.dark,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(color: AppColors.coffee, Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, LayoutScreen.routeName);
            },
          ),
          title: Text(
            arg.title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.coffee,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(AppAssets.suraDetailsCorners2),
              Spacer(),
              Text(
                arg.title,
                style: TextStyle(
                    color: AppColors.coffee,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              Spacer(),
              Image.asset(AppAssets.suraDetailsCorners),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  arg.body,
                  style: theme.textTheme.bodyLarge,
                  textDirection: TextDirection.rtl,
                ),
              ],
            ),
          )
        ]));
  }
}
