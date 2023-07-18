class NameModel {
  final String title;
  final String first;
  final String last;

  NameModel({required this.title, required this.first, required this.last});

  factory NameModel.fromJson(Map<String, dynamic> json) {
    return NameModel(
        title: json["title"] as String? ?? "",
        first: json["first"] as String? ?? "",
        last: json["last"] as String? ?? "");
  }
}
