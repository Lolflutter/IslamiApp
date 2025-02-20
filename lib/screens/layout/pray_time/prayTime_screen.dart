import 'package:eslami/core/constant/app_assets.dart';
import 'package:eslami/screens/layout/pray_time/widgets/azkar_card.dart';
import 'package:eslami/screens/layout/pray_time/widgets/morning_azkar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:eslami/core/theme/app_colors.dart';
import 'package:eslami/screens/layout/pray_time/widgets/time_card.dart';

import '../../../api manager/network service/pray_time_service.dart';

class PrayTimeScreen extends StatefulWidget {
  static const String routeName = 'PrayTimeScreen';

  const PrayTimeScreen({super.key});

  @override
  _PrayTimeScreenState createState() => _PrayTimeScreenState();
}

class _PrayTimeScreenState extends State<PrayTimeScreen> {
  final PrayerTimesService _prayerTimesService = PrayerTimesService();
  Map<String, dynamic>? prayerData;
  String? nextPrayer;
  String? nextPrayerTime;

  @override
  void initState() {
    super.initState();
    _loadPrayerTimes();
  }

  void _loadPrayerTimes() async {
    var data = await _prayerTimesService.getPrayerTimes("Cairo", "Egypt");
    setState(() {
      prayerData = data;
      _calculateNextPrayer();
    });
  }

  void _calculateNextPrayer() {
    if (prayerData == null) return;

    var now = TimeOfDay.now();
    var timings = prayerData!["timings"];

    for (var prayer in timings.entries) {
      var timeParts = prayer.value.split(":");
      var prayerTime = TimeOfDay(
        hour: int.parse(timeParts[0]),
        minute: int.parse(timeParts[1]),
      );

      if (prayerTime.hour > now.hour ||
          (prayerTime.hour == now.hour && prayerTime.minute > now.minute)) {
        nextPrayer = prayer.key;
        nextPrayerTime = prayer.value;
        break;
      }
    }

    // إذا لم نجد أي صلاة لاحقة، نجعلها الفجر في اليوم التالي
    nextPrayer ??= "Fajr";
    nextPrayerTime ??= prayerData!["timings"]["Fajr"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.prayTimeBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xb3202020), Color(0xff202020)],
              end: Alignment.topCenter,
              begin: Alignment.bottomCenter,
            ),
          ),
          child: prayerData == null
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Image.asset(
                          AppAssets.islamiMosquelogo,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.38,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.coffee,
                            borderRadius: BorderRadius.circular(40)),
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text('History',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    Text(prayerData!["gregorian"],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Pray Time',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black26,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      prayerData!["day"],
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text('Hijri Date',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                    Text(prayerData!["hijri"],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16)),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05),
                            CarouselSlider.builder(
                              itemCount: prayerData!["timings"].keys.length,
                              itemBuilder: (context, index, realIndex) {
                                String prayerName = prayerData!["timings"]
                                    .keys
                                    .elementAt(index);
                                String time =
                                    prayerData!["timings"][prayerName]!;
                                return TimeCard(prayer: prayerName, time: time);
                              },
                              options: CarouselOptions(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                viewportFraction: 0.31,
                                enlargeCenterPage: true,
                                pageSnapping: true,
                                disableCenter: true,
                                animateToClosest: true,
                                enableInfiniteScroll: true,
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Next Pray: $nextPrayer at $nextPrayerTime',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Azkar',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pushNamed(context,EveningAzkarCard.routeName),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.44,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.dark,
                                border: Border.all(
                                    color: AppColors.coffee, width: 2)),
                            child: Column(
                              children: [
                                Image.asset(
                                  AppAssets.azkarIcon,
                                  fit: BoxFit.cover,
                                  height:  MediaQuery.of(context).size.height * 0.15,
                                  width: MediaQuery.of(context).size.width * 0.3 ,
                                ),
                                Text(
                                  'Evening Azkar',
                                  style: TextStyle(
                                      fontSize: 16, color: AppColors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.pushNamed(context,MorningAzkarCard.routeName),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.44,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.dark,
                                border: Border.all(
                                    color: AppColors.coffee, width: 2)),
                            child: Column(
                              children: [
                                Image.asset(
                                  AppAssets.azkarIcon,
                                  fit: BoxFit.cover,
                                  height:  MediaQuery.of(context).size.height * 0.15,
                                  width: MediaQuery.of(context).size.width * 0.3 ,
                                ),
                                Text(
                                  'morning Azkar',
                                  style: TextStyle(
                                      fontSize: 16, color: AppColors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
