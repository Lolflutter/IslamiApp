import 'package:dio/dio.dart';
import '../models/radio_model.dart';
import '../models/reciter_model.dart';
import '../models/time_model.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = "https://api.aladhan.com/v1/timingsByCity";


  Future<List<RadioModel>> fetchRadios() async {
    try {
      Response response = await _dio.get('https://mp3quran.net/api/v3/radios?language=ar');
      List radios = response.data['radios']; // الـ API بيرجع List
      return radios.map((e) => RadioModel.fromJson(e)).toList();
    } catch (e) {
      print("$e");
      return [];
    }
  }
  Future<List<ReciterModel>> fetchReciters() async {
    try {
      Response response = await _dio.get('https://mp3quran.net/api/v3/reciters?language=ar');
      List reciters = response.data['reciters']; // الـ API بيرجع List
      return reciters.map((e) => ReciterModel.fromJson(e)).toList();
    } catch (e) {
      print(" $e");
      return [];
    }
  }
}