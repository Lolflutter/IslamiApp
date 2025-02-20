class PrayerTimesModel {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final String gregorianDate;
  final String hijriDate;
  final String weekday;

  PrayerTimesModel({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
    required this.gregorianDate,
    required this.hijriDate,
    required this.weekday,
  });

  factory PrayerTimesModel.fromJson(Map<String, dynamic> json) {
    var timings = json['data']['timings'];
    var date = json['data']['date'];
    var hijri = date['hijri'];
    var gregorian = date['gregorian'];

    return PrayerTimesModel(
      fajr: _convertTo12HourFormat(timings['Fajr']),
      sunrise: _convertTo12HourFormat(timings['Sunrise']),
      dhuhr: _convertTo12HourFormat(timings['Dhuhr']),
      asr: _convertTo12HourFormat(timings['Asr']),
      maghrib: _convertTo12HourFormat(timings['Maghrib']),
      isha: _convertTo12HourFormat(timings['Isha']),
      gregorianDate: "${gregorian['day']} ${gregorian['month']['en']} ${gregorian['year']}",
      hijriDate: "${hijri['day']} ${hijri['month']['ar']} ${hijri['year']}",
      weekday: hijri['weekday']['ar'],
    );
  }

  static String _convertTo12HourFormat(String time24) {
    List<String> parts = time24.split(':');
    int hour = int.parse(parts[0]);
    String period = hour >= 12 ? "PM" : "AM";
    hour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return "$hour:${parts[1]} $period";
  }
}
