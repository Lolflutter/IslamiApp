import 'package:eslami/screens/layout/hadith/hadith_model.dart';
import 'package:eslami/screens/layout/hadith/wedgets/hadith_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../core/constant/app_assets.dart';
import '../../../core/theme/app_colors.dart';

class HadithScreen extends StatefulWidget {
  static const String routeName = 'HadithScreen';

  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  List<HadithModel> ahadeth = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) {
            if(ahadeth.isEmpty){
              readHadith();
            }
    },);

    super.initState();
  }

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
              image: AssetImage(AppAssets.hadithBg), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xb3202020),
              Color(0xff202020),
            ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Center(child: Image.asset(AppAssets.islamiMosquelogo)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.657,
                width: double.infinity,
                child: ahadeth.isEmpty
                    ? Center(
                  child: CircularProgressIndicator(), // Show loader while data is loading
                )
                    : CarouselSlider.builder(
                  itemCount: ahadeth.length,
                  itemBuilder: (context, index, realIndex) => HadithCard(
                    hadithModel: ahadeth[index],
                  ),
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.657,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    pageSnapping: true,
                    disableCenter: true,
                    animateToClosest: true,
                    enableInfiniteScroll: true,
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  readHadith() async {
    for (int i = 1; i <= 50; i++) {
      String fullHadith = await rootBundle.loadString('assets/Hadeeth/h$i.txt');
      List<String> hadith = fullHadith.split('\n');
      ahadeth.add(HadithModel(title: hadith[0].trim(), body: hadith[1].trim()));
    }
    setState(() {});
  }

}
