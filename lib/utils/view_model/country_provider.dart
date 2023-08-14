import 'package:flutter/cupertino.dart';
import 'package:flutter_defualt_project/data/models/company_model/car_model/car_model.dart';
import 'package:flutter_defualt_project/data/models/company_model/company_model.dart';
import 'package:flutter_defualt_project/data/models/dynamic_view_models/dynamic_view_model.dart';
import 'package:flutter_defualt_project/data/models/universal_response.dart';
import 'package:flutter_defualt_project/data/network/api_service.dart';

import '../../data/models/country_models/country_model.dart';

class CountryProvider with ChangeNotifier{
  CountryProvider({required this.apiService});
  final ApiService apiService;
  bool isLoading=false;


  List<CountryModel> countries=[];
  List<CompanyModel> companies=[];
  List<DynamicViewModel> dynamicViews=[];


  CarModel? carModel;

  getAllCountry()async{
    isLoading=true;
    UniversalData universalData =await  apiService.getAllCountry();
    if(universalData.error.isEmpty){
      countries=universalData.data;
    }else{
      debugPrint("ERROR:${universalData.error}");
    }
    isLoading=false;
    notifyListeners();
  }

  getAllCompanies()async{
    isLoading=true;
    UniversalData universalData =await  apiService.getAllCompany();
    if(universalData.error.isEmpty){
      companies=universalData.data;
    }else{
      debugPrint("ERROR:${universalData.error}");
    }
    isLoading=false;
    notifyListeners();
  }

  getAllDynamicViews()async{
    isLoading=true;
    UniversalData universalData =await  apiService.getDynamicData();
    if(universalData.error.isEmpty){
      dynamicViews=universalData.data;
    }else{
      debugPrint("ERROR:${universalData.error}");
    }
    isLoading=false;
    notifyListeners();
  }

  getCar({required String id})async{
    isLoading=true;
    UniversalData universalData =await  apiService.getCar(id: id);
    if(universalData.error.isEmpty){
      carModel=universalData.data;
    }else{
      debugPrint("ERROR:${universalData.error}");
    }
    isLoading=false;
    notifyListeners();
  }

}