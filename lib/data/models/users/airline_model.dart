class AirlineModel {
  final String id1;
  final int id;
  final String name;
  final String country;
  final String logo;
  final String slogan;
  final String headQuaters;
  final String website;
  final String established;

  AirlineModel({
    required this.id1,
    required this.id,
    required this.name,
    required this.website,
    required this.country,
    required this.logo,
    required this.established,
    required this.headQuaters,
    required this.slogan,
  });

  factory AirlineModel.fromJson(Map<String, dynamic> json) {
    return AirlineModel(
        id1: json["_id"] as String? ?? "",
        id: json["id"] as int? ?? 0,
        name: json["name"] as String? ?? "",
        website: json["website"] as String? ?? "",
        country: json["country"] as String? ?? "",
        logo: json["logo"] as String? ?? "",
        established: json["established"] as String? ?? "",
        headQuaters: json["head_quaters"] as String? ?? "",
        slogan: json["slogan"] as String? ?? "");
  }
}
