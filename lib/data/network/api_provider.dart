import 'dart:convert';


import 'package:flutter_defualt_project/data/models/namaz_time_model.dart';
import 'package:http/http.dart' as http;

import '../models/universal_response.dart';

class ApiProvider {

  Future<UniversalResponse> translateText(String text,String firstLang,String secondLang) async {
    // Uri uri = Uri.parse("https://api.mymemory.translated.net/get?q=!&langpair=en|it");
    Uri uri =Uri.https("api.mymemory.translated.net","/get",{
      "q":"$text",
      "langpair":"$firstLang|$secondLang"
    });
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
            data: (jsonDecode(response.body))["responseData"]["translatedText"] as String);
      }
      return UniversalResponse(error: "ERROR");
    } catch (error) {
      return UniversalResponse(error: error.toString());
    }
  }


}