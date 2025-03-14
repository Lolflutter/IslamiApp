import 'package:eslami/core/constant/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:eslami/core/theme/app_colors.dart';

class HistoryWidget extends StatelessWidget {
  String surahAr;
  String surahEn;
  String ayaNumber;
  HistoryWidget({
    super.key,
    required this.surahEn,
    required this.surahAr,
    required this.ayaNumber,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: AppColors.coffee, borderRadius: BorderRadius.circular(20)),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        surahEn,
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: Colors.black),
                      ),
                      Spacer(),
                      Text(
                        surahAr,
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: Colors.black),
                      ),
                      Spacer(),
                      Text(
                        ayaNumber,
                        style: theme.textTheme.bodySmall!
                            .copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Image.asset(AppAssets.historyLogo, fit: BoxFit.cover),
              ],
            )));
  }
}
