import 'package:flutter_defualt_project/data/models/namaz_time_model.dart';
import 'package:flutter_defualt_project/data/network/api_provider.dart';

import '../models/universal_response.dart';

class ApiRepository{
  final ApiProvider apiProvider;
  ApiRepository({required this.apiProvider});

  Future<String> translate({required String text,required String firstLang, required String secondLang})async{
    UniversalResponse universalResponse=await apiProvider.translateText(text,firstLang,secondLang);
    if(universalResponse.error.isEmpty){
      return universalResponse.data as String;
    }
    return "";
  }
}