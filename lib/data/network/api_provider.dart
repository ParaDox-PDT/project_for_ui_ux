import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/models/users/user_model.dart';
import 'package:flutter_defualt_project/utils/constants.dart';
import 'package:http/http.dart' as http;

import '../models/universal_response.dart';
import 'network_utils.dart';

class ApiProvider {
  Future<UniversalResponse> getAllUser(
      { required int page, required int count}) async {
    Uri uri = Uri.parse("https://api.instantwebtools.net/v1/passenger?page=$page&size=$count");
    try {
      http.Response response = await http.post(
        uri,
      );
      if (response.statusCode == HttpStatus.ok) {
        return UniversalResponse(
            data: (jsonDecode(response.body)["data"] as List?)
                ?.map((e) => UserModel.fromJson(e))
                .toList());
      }
      print('ERROR:$response');
      return handleHttpErrors(response);
    } on SocketException {
      return UniversalResponse(error: "Internet Error!");
    } on FormatException {
      return UniversalResponse(error: "Format Error!");
    } catch (err) {
      debugPrint("ERROR:$err. ERROR TYPE: ${err.runtimeType}");
      return UniversalResponse(error: err.toString());
    }
  }
}
