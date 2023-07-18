import 'package:flutter_defualt_project/data/models/user/location_model.dart';

import 'dob_model.dart';
import 'login_model.dart';
import 'name_model.dart';
import 'picture_model.dart';
import 'register_model.dart';

class UserModel {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final LocationModel locationModel;
  final NameModel nameModel;
  final LoginModel loginModel;
  final DobModel dobModel;
  final RegisteredModel registeredModel;
  final PictureModel pictureModel;

  UserModel(
      {required this.pictureModel,
        required this.locationModel,
      required this.registeredModel,
      required this.dobModel,
      required this.loginModel,
      required this.nameModel,
      required this.phone,
      required this.email,
      required this.cell,
      required this.gender,
      required this.nat});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      locationModel: LocationModel.fromJson(json["location"]),
        pictureModel: PictureModel.fromJson(json["picture"]),
        registeredModel: RegisteredModel.fromJson(json["registered"]),
        dobModel: DobModel.fromJson(json["dob"]),
        loginModel: LoginModel.fromJson(json["login"]),
        nameModel: NameModel.fromJson(json["name"]),
        phone: json["phone"] as String? ?? "",
        email: json["email"] as String? ?? "",
        cell: json["cell"] as String? ?? "",
        gender: json["gender"] as String? ?? "",
        nat: json["nat"] as String? ?? "");
  }
}
