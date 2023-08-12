import 'package:flutter_defualt_project/data/models/country_models/continent_model.dart';

class CountryModel {
  // {
  // "code": "AD",
  // "name": "Andorra",
  // "phone": "376",
  // "capital": "Andorra la Vella",
  // "currency": "EUR",
  // "emoji": "🇦🇩"
  // },
  final String code;
  final String name;
  final String phone;
  final String capital;
  final String currency;
  final String emoji;
  final ContinentModel continentModel;

  CountryModel(
      {required this.code,
      required this.name,
      required this.currency,
      required this.continentModel,
      required this.capital,
      required this.emoji,
      required this.phone});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
        code: json["code"] as String? ?? "",
        name: json["name"] as String? ?? "",
        currency: json["currency"] as String? ?? "",
        continentModel:ContinentModel.fromJson( json["continent"]),
        capital: json["capital"] as String? ?? "",
        emoji: json["emoji"] as String? ?? "",
        phone: json["phone"] as String? ?? "");
  }
}
