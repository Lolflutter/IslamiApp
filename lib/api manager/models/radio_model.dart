class RadioModel {
  final String name;
  final String url;

  RadioModel({required this.name, required this.url});

  factory RadioModel.fromJson(Map<String, dynamic> json) {
    return RadioModel(
      name: json['name'],
      url: json['url'],
    );
  }
}
