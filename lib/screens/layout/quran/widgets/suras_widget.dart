import 'package:flutter/material.dart';
import '../../../../core/constant/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../sura_details.dart';

class SurasWidget extends StatelessWidget {
  String surahAr;
  String surahEn;
  String ayaNumber;
  int index;
  void Function(int value) onTap;
  SurasWidget({
    super.key,
    required this.index,
    required this.surahEn,
    required this.surahAr,
    required this.ayaNumber,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        onTap(index);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SuraDetails(
              surahAr: surahAr,
              surahEn: surahEn,
              index: index,
            ),
          ),
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(fit: StackFit.loose, alignment: Alignment.center, children: [
            Image.asset(AppAssets.suraIcon),
            Text(
              '${index+1}',
              style: theme.textTheme.bodySmall!
                  .copyWith(color: theme.primaryColorLight),
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  surahEn,
                  style: TextStyle(color: AppColors.white, fontSize: 20),
                ),
                Text(
                  '${ayaNumber} verses',
                  style: theme.textTheme.bodySmall!
                      .copyWith(color: theme.primaryColorLight),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            surahAr,
            style: theme.textTheme.bodyLarge!
                .copyWith(color: theme.primaryColorLight),
          )
        ],
      ),
    );
  }
}
