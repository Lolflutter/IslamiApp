import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/theme/app_colors.dart';

class MorningAzkarCard extends StatefulWidget {
  static const String routeName = 'MorningAzkarCard';

  @override
  State<MorningAzkarCard> createState() => _MorningAzkarCardState();
}

class _MorningAzkarCardState extends State<MorningAzkarCard> {
  List<String> azkarList = [];

  @override
  void initState() {
    super.initState();
    _loadAzkar();
  }

  Future<void> _loadAzkar() async {
    try {
      String jsonString = await rootBundle.loadString('assets/azkar.json');
      Map<String, dynamic> jsonData = json.decode(jsonString);
      List<dynamic> azkarData = jsonData["أذكار الصباح"];

      setState(() {
        azkarList = azkarData.map((e) => e["content"].toString()).toList();
      });
    } catch (e) {
      setState(() {
        azkarList = ['❌ خطأ في تحميل الأذكار. حاول مرة أخرى لاحقًا.'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.dark,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("أذكار الصباح"),
        centerTitle: true,
      ),
      body: azkarList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: azkarList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            color: AppColors.coffee,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                azkarList[index],
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
