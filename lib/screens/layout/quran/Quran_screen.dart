import 'package:eslami/core/constant/app_assets.dart';
import 'package:eslami/core/theme/app_colors.dart';
import 'package:eslami/screens/layout/quran/sura_details.dart';
import 'package:eslami/screens/layout/quran/widgets/history_widget.dart';
import 'package:eslami/screens/layout/quran/widgets/suras_widget.dart';
import 'package:flutter/material.dart';

class QuranScreen extends StatefulWidget {
  static const String routeName = 'QuranScreen';

  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  final List<String> arabicQuranSuras = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];
  final List<String> englishQuranSurahs = [
    "Al-Fatiha",
    "Al-Baqarah",
    "Aal-E-Imran",
    "An-Nisa'",
    "Al-Ma'idah",
    "Al-An'am",
    "Al-A'raf",
    "Al-Anfal",
    "At-Tawbah",
    "Yunus",
    "Hud",
    "Yusuf",
    "Ar-Ra'd",
    "Ibrahim",
    "Al-Hijr",
    "An-Nahl",
    "Al-Isra",
    "Al-Kahf",
    "Maryam",
    "Ta-Ha",
    "Al-Anbiya",
    "Al-Hajj",
    "Al-Mu'minun",
    "An-Nur",
    "Al-Furqan",
    "Ash-Shu'ara",
    "An-Naml",
    "Al-Qasas",
    "Al-Ankabut",
    "Ar-Rum",
    "Luqman",
    "As-Sajda",
    "Al-Ahzab",
    "Saba",
    "Fatir",
    "Ya-Sin",
    "As-Saffat",
    "Sad",
    "Az-Zumar",
    "Ghafir",
    "Fussilat",
    "Ash-Shura",
    "Az-Zukhruf",
    "Ad-Dukhan",
    "Al-Jathiya",
    "Al-Ahqaf",
    "Muhammad",
    "Al-Fath",
    "Al-Hujurat",
    "Qaf",
    "Adh-Dhariyat",
    "At-Tur",
    "An-Najm",
    "Al-Qamar",
    "Ar-Rahman",
    "Al-Waqi'a",
    "Al-Hadid",
    "Al-Mujadila",
    "Al-Hashr",
    "Al-Mumtahina",
    "As-Saff",
    "Al-Jumu'a",
    "Al-Munafiqun",
    "At-Taghabun",
    "At-Talaq",
    "At-Tahrim",
    "Al-Mulk",
    "Al-Qalam",
    "Al-Haqqah",
    "Al-Ma'arij",
    "Nuh",
    "Al-Jinn",
    "Al-Muzzammil",
    "Al-Muddathir",
    "Al-Qiyamah",
    "Al-Insan",
    "Al-Mursalat",
    "An-Naba'",
    "An-Nazi'at",
    "Abasa",
    "At-Takwir",
    "Al-Infitar",
    "Al-Mutaffifin",
    "Al-Inshiqaq",
    "Al-Buruj",
    "At-Tariq",
    "Al-A'la",
    "Al-Ghashiyah",
    "Al-Fajr",
    "Al-Balad",
    "Ash-Shams",
    "Al-Lail",
    "Ad-Duha",
    "Ash-Sharh",
    "At-Tin",
    "Al-Alaq",
    "Al-Qadr",
    "Al-Bayyina",
    "Az-Zalzalah",
    "Al-Adiyat",
    "Al-Qari'a",
    "At-Takathur",
    "Al-Asr",
    "Al-Humazah",
    "Al-Fil",
    "Quraysh",
    "Al-Ma'un",
    "Al-Kawthar",
    "Al-Kafirun",
    "An-Nasr",
    "Al-Masad",
    "Al-Ikhlas",
    "Al-Falaq",
    "An-Nas"
  ];
  final List<String> ayaNumber = [
    '7',
    '286',
    '200',
    '176',
    '120',
    '165',
    '206',
    '75',
    '129',
    '109',
    '123',
    '111',
    '43',
    '52',
    '99',
    '128',
    '111',
    '110',
    '98',
    '135',
    '112',
    '78',
    '118',
    '64',
    '77',
    '227',
    '93',
    '88',
    '69',
    '60',
    '34',
    '30',
    '73',
    '54',
    '45',
    '83',
    '182',
    '88',
    '75',
    '85',
    '54',
    '53',
    '89',
    '59',
    '37',
    '35',
    '38',
    '29',
    '18',
    '45',
    '60',
    '49',
    '62',
    '55',
    '78',
    '96',
    '29',
    '22',
    '24',
    '13',
    '14',
    '11',
    '11',
    '18',
    '12',
    '12',
    '30',
    '52',
    '52',
    '44',
    '28',
    '28',
    '20',
    '56',
    '40',
    '31',
    '50',
    '40',
    '46',
    '42',
    '29',
    '19',
    '36',
    '25',
    '22',
    '17',
    '19',
    '26',
    '30',
    '20',
    '15',
    '21',
    '11',
    '8',
    '5',
    '19',
    '5',
    '8',
    '8',
    '11',
    '11',
    '8',
    '3',
    '9',
    '5',
    '4',
    '6',
    '3',
    '6',
    '3',
    '5',
    '4',
    '5',
    '6'
  ];
  List<String> suraSearchAr = [];
  List<String> suraSearchEn = [];
  List<String> ayaNumberSearch = [];
  List<int> suraIds = [];
  List<int> Ids = [];
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
              image: AssetImage(AppAssets.quranBg), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xb3202020),
              Color(0xff202020),
            ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Center(child: Image.asset(AppAssets.islamiMosquelogo)),
                ),
                TextField(
                  onChanged: (value) => search(value),
                  style: TextStyle(color: AppColors.white),
                  decoration: InputDecoration(
                    hintText: 'sura name',
                    hintStyle: TextStyle(color: AppColors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColors.coffee,
                        width: 1,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColors.coffee,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColors.coffee,
                        width: 1,
                      ),
                    ),
                    prefixIcon: ImageIcon(
                      AssetImage(AppAssets.searchIcon),
                      color: AppColors.coffee,
                    ),
                  ),
                ),
                Text(
                  'Most recently',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: AppColors.white),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height* 0.14,
                    child: ListView.builder(
                      itemCount:Ids.length ,
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(context, index) {
                        HistoryWidget(
                            surahEn: arabicQuranSuras[Ids[index]],
                            surahAr: arabicQuranSuras[Ids[index]],
                            ayaNumber:ayaNumber[Ids[index]]
                        );

                      }
                    )
                ),

                Text(
                  'Sura List',
                  style: TextStyle(
                    color: AppColors.white,
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return suraSearchAr.isEmpty
                            ? SurasWidget(
                                index: index,
                                ayaNumber: ayaNumber[index],
                                surahAr: arabicQuranSuras[index],
                                surahEn: arabicQuranSuras[index],
                                onTap: saveId,
                              )
                            : SurasWidget(
                                index: suraIds[index],
                                ayaNumber: ayaNumber[index],
                                surahAr: suraSearchAr[index],
                                surahEn: suraSearchEn[index],
                                onTap: saveId,
                              );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount:
                          suraSearchAr.isEmpty ? 114 : suraSearchAr.length),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void search(String q) {
    suraSearchAr = [];
    suraSearchEn = [];
    suraIds = [];
    ayaNumberSearch = [];
    for (int i = 0; i < arabicQuranSuras.length; i++) {
      if (arabicQuranSuras[i].contains(q)) {
        suraSearchAr.add(arabicQuranSuras[i]);
        suraSearchEn.add(englishQuranSurahs[i]);
        ayaNumberSearch.add(ayaNumber[i]);
        suraIds.add(i);
      }
    }
    setState(() {});
  }


  void saveId(int index) {
    if (!Ids.contains(index)) {
      Ids.add(index);
    }
    setState(() {});
  }

}

