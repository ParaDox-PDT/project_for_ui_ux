class StreetModel {
  final int number;
  final String name;

  StreetModel({required this.number, required this.name});

  factory StreetModel.fromJson(Map<String, dynamic> json) {
    return StreetModel(
        number: json["number"] as int? ?? 0,
        name: json["name"] as String? ?? "");
  }
}
