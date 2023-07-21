import 'airline_model.dart';

class UserModel {
  final String id;
  final String name;
  final int trips;
  final AirlineModel airlineModel;

  UserModel(
      {required this.id,
      required this.name,
      required this.trips,
      required this.airlineModel,});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["_id"] as String? ?? "",
        name: json["name"] as String? ?? "",
        trips: json["trips"] as int? ?? 0,
        airlineModel: AirlineModel.fromJson(json["airline"][0]),);
  }
}
