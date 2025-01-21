class Category {
  String image;
  String title;
  String desc;

  Category({
    required this.image,
    required this.title,
    required this.desc,
  });
  static List<Category> categoryData = [
    Category(
      image: 'assets/initial pages/Frame 3.png',
      title: 'Welcome To Islmi App',
      desc: '',
    ),
    Category(
      image: 'assets/initial pages/Frame 3 (1).png',
      title: 'Welcome To Islami',
      desc: 'We Are Very Excited To Have You In Our Community',
    ),
    Category(
      image: 'assets/initial pages/Frame 3 (2).png',
      title: 'Reading the Quran',
      desc: 'Read, and your Lord is the Most Generous',
    ),
    Category(
      image: 'assets/initial pages/Frame 3 (3).png',
      title: 'Bearish',
      desc: 'Praise the name of your Lord, the Most High',
    ),
    Category(
      image: 'assets/initial pages/Frame 3 (4).png',
      title: 'Holy Quran Radio',
      desc: 'You can listen to the Holy Quran Radio through the application for free and easily',
    ),
  ];
}
