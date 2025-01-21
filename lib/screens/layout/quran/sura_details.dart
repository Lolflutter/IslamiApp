import 'package:eslami/core/constant/app_assets.dart';
import 'package:eslami/core/theme/app_colors.dart';
import 'package:eslami/screens/layout/quran/Quran_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'SuraDetails';
  String? surahAr;
  String? surahEn;
  final int index;

  SuraDetails({
    super.key,
    this.surahAr,
    this.surahEn,
    required this.index,
  });

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String suraDetails = '';
  List<String> aya = [];

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    if (suraDetails.isEmpty) {
      readFile(widget.index);
    }

    return Scaffold(
        backgroundColor: AppColors.dark,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(color: AppColors.coffee, Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(context, QuranScreen.routeName);
            },
          ),
          title: Text(
            widget.surahEn!,
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
                widget.surahAr!,
                style: TextStyle(
                    color: AppColors.coffee,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              Spacer(),
              Image.asset(AppAssets.suraDetailsCorners),
            ],
          ),
          suraDetails.isEmpty
              ? Center(child: const CircularProgressIndicator())
              : Expanded(
                child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                  child: Text.rich(
                      TextSpan(
                          children: aya.map((e) {
                        int index = aya.indexOf(e);
                        return TextSpan(
                            text: e.trim(),
                            style: theme.textTheme.bodyMedium!
                                .copyWith(color: theme.primaryColor),
                            children: [TextSpan(text: '[${index + 1}]')]);
                      }).toList()),
                      textDirection: TextDirection.rtl,
                    style: TextStyle(fontFamily: GoogleFonts.amiriQuran().fontFamily ,fontSize: 18),
                    ),
                ),
              )
        ]));
  }

  void readFile(int index) async {
    suraDetails =
        await rootBundle.loadString('assets/suras/Suras/${index + 1}.txt');
    aya = suraDetails.split('\n');
    setState(() {});
  }
}
