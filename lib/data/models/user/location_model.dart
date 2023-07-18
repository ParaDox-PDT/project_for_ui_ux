import 'street_,model.dart';

class LocationModel {
  final StreetModel streetModel;
  final String city;
  final String state;
  final String country;
  final int postcode;

  LocationModel(
      {required this.streetModel,
      required this.country,
      required this.city,
      required this.postcode,
      required this.state});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
        streetModel: StreetModel.fromJson(json["street"]),
        country: json["country"] as String? ?? "",
        city: json["city"] as String? ?? "",
        postcode: json["postcode"] as int? ?? 0,
        state: json["state"] as String? ?? "");
  }

}
