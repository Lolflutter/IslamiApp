import 'package:eslami/screens/layout/radio/widgets/radio%20widget.dart';
import 'package:eslami/screens/layout/radio/widgets/reciter%20widget.dart';
import 'package:flutter/material.dart';
import '../../../api manager/models/radio_model.dart';
import '../../../api manager/models/reciter_model.dart';
import '../../../api manager/network service/radio_services.dart';
import '../../../core/constant/app_assets.dart';
import '../../../core/theme/app_colors.dart';

class RadioScreen extends StatefulWidget {
  static const String routeName = 'RadioScreen';
  const RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int selectedIndex = 0;
  bool isLoading = true;
  String? errorMessage;
  List<RadioModel> radioStations = [];
  List<ReciterModel> reciters = [];

  final ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      List<RadioModel> radios = await apiService.fetchRadios();
      List<ReciterModel> fetchedReciters = await apiService.fetchReciters();

      setState(() {
        radioStations = radios;
        reciters = fetchedReciters;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = "حدث خطأ أثناء تحميل البيانات. يرجى المحاولة لاحقًا.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.radioBg),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Image.asset(AppAssets.islamiMosquelogo),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() => selectedIndex = 0);
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: selectedIndex == 0
                              ? AppColors.coffee
                              : Colors.transparent,
                          border: Border.all(
                            color: selectedIndex == 0
                                ? Colors.transparent
                                : AppColors.coffee,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Radio',
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() => selectedIndex = 1);
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: selectedIndex == 1
                              ? AppColors.coffee
                              : Colors.transparent,
                          border: Border.all(
                            color: selectedIndex == 1
                                ? Colors.transparent
                                : AppColors.coffee,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Reciters',
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : errorMessage != null
                    ? Center(
                  child: Text(
                    errorMessage!,
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
                    : selectedIndex == 0
                    ? Radiowidget(radios: radioStations)
                    : Reciterwidget(reciters: reciters),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
