import 'package:dio/dio.dart';

class PrayerTimesService {
  final Dio _dio = Dio();
  final String _baseUrl = "https://api.aladhan.com/v1/timingsByCity";

  Future<Map<String, dynamic>> getPrayerTimes(String city, String country) async {
    try {
      Response response = await _dio.get(
        _baseUrl,
        queryParameters: {
          "city": city,
          "country": country,
          "method": 5,
        },
      );

      var data = response.data['data'];
      var timings = data['timings'];
      var date = data['date'];

      return {
        "timings": {
          "Fajr": timings['Fajr'],
          "Sunrise": timings['Sunrise'],
          "Dhuhr": timings['Dhuhr'],
          "Asr": timings['Asr'],
          "Maghrib": timings['Maghrib'],
          "Isha": timings['Isha'],
        },
        "gregorian": date['gregorian']['date'], // التاريخ الميلادي
        "hijri": date['hijri']['date'], // التاريخ الهجري
        "day": date['gregorian']['weekday']['en'] // اسم اليوم
      };
    } catch (e) {
      print("Error fetching prayer times: $e");
      return {
        "timings": {},
        "gregorian": "N/A",
        "hijri": "N/A",
        "day": "N/A"
      };
    }
  }
}
