import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_defualt_project/data/models/google_search/google_search_model.dart';
import 'package:flutter_defualt_project/utils/constants.dart';
import 'package:http/http.dart' as http;

import '../models/universal_response.dart';
import 'network_utils.dart';

class ApiProvider {
   Future<UniversalResponse> searchFromGoogle(
      {required String query, required int page, required int count}) async {
    Uri uri = Uri.https(
      baseUrl,
      "/search",
      {
        "q": query,
        "page": page.toString(),
        "num": count.toString(),
      },
    );
    try {
      http.Response response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
          "X-API-KEY": "$apiKey",
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        return UniversalResponse(
          data: GoogleSearchModel.fromJson(
            jsonDecode(response.body),
          ),
        );
      }
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
