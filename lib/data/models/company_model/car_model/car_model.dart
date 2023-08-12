

class CarModel {

  final int id;
  final String carModel;
  final String logo;
  final int establishedYear;
  final int averagePrice;
  final String description;
  final List<dynamic> carPics;

  CarModel(
      {required this.id,
      required this.carModel,
      required this.logo,
      required this.establishedYear,
      required this.description,
      required this.averagePrice,
      required this.carPics});

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
        description: json["description"] as String? ?? "",
        carPics: json["car_pics"] as List<dynamic>? ?? [],
        id: json["id"] as int? ?? 0,
        carModel: json["car_model"] as String? ?? "",
        averagePrice: json["average_price"] as int? ?? 0,
        logo: json["logo"] as String? ?? "",
        establishedYear: json["established_year"] as int? ?? 0);
  }
}
