import 'package:eslami/screens/layout/hadith/hadith_model.dart';
import 'package:eslami/screens/layout/hadith/wedgets/hadith_details.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/app_colors.dart';

class HadithCard extends StatelessWidget {
  final HadithModel hadithModel;
  const HadithCard({super.key, required this.hadithModel});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadithDetails.routeName,
            arguments: hadithModel);
      },
      child: Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.all(4),
        color: AppColors.coffee,
        child: Column(
          textDirection: TextDirection.rtl,
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: Image.asset(AppAssets.hadithCorner),
                  ),
                  Center(
                    child: Text(
                      hadithModel.title,
                      style: theme.textTheme.bodyMedium!
                          .copyWith(color: AppColors.dark, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Image.asset(AppAssets.hadithCorner2),
                  ),
                ],
              ),
            ),
            Text(
              hadithModel.body,
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: AppColors.dark, fontSize: 23),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            )
          ],
        ),
      ),
    );
  }
}
