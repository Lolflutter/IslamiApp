class ReciterModel {
  final String name;
  final String server;

  ReciterModel({required this.name, required this.server, });

  factory ReciterModel.fromJson(Map<String, dynamic> json) {
    return ReciterModel(
      name: json['name'] ?? 'غير معروف',
      server: json['server'] ?? '',

    );
  }
}
