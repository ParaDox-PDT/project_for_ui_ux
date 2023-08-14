import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_defualt_project/data/models/company_model/car_model/car_model.dart';
import 'package:flutter_defualt_project/data/models/company_model/company_model.dart';
import 'package:flutter_defualt_project/data/models/country_models/country_model.dart';
import 'package:flutter_defualt_project/data/models/dynamic_view_models/dynamic_view_model.dart';
import 'package:flutter_defualt_project/utils/constant.dart';

import '../models/universal_response.dart';

class ApiService {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));
  final dio2 = Dio(BaseOptions(baseUrl: "https://dynamic-view-api.free.mockoapp.net"));

  ApiService() {
    _init();
  }

  _init() {
    dio.interceptors.add(InterceptorsWrapper(
      onError: (error, handler) async {
        debugPrint("ERRORGA KIRDI:${error.message} and ${error.response}");
        return handler.next(error);
      },
      onRequest: (options, handler) {
        debugPrint("SO'ROV  YUBORILDI :${handler.isCompleted}");
        return handler.next(options);
      },
      onResponse: (response, handler) async {
        debugPrint("JAVOB  KELDI :${handler.isCompleted}");
        return handler.next(response);
      },
    ));
  }

  Future<UniversalData> getAllCountry() async {
    Response response;
    try {
      response = await dio.get("/countries");
      if (response.statusCode == 200) {
        return UniversalData(
            data: (response.data["data"]["countries"] as List?)
                    ?.map((e) => CountryModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalData(error: "Other data");
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getAllCompany() async {
    Response response;
    try {
      response = await dio.get("/companies");
      if (response.statusCode == 200) {
        return UniversalData(
            data: (response.data["data"] as List?)
                    ?.map((e) => CompanyModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalData(error: "Other error");
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getCar({required String id}) async {
    Response response;
    try {
      response = await dio.get("/companies/$id");
      if (response.statusCode == 200) {
        return UniversalData(
            data: CarModel.fromJson(response.data));
      }
      return UniversalData(error: "Other error");
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

  Future<UniversalData> getDynamicData() async {
    Response response;
    try {
      response = await dio2.get("/views");
      if (response.statusCode == 200) {
        return UniversalData(
            data: (response.data["dynamic_views"] as List?)
                ?.map((e) => DynamicViewModel.fromJson(e))
                .toList() ??
                []);
      }
      return UniversalData(error: "Other data");
    } on DioException catch (e) {
      if (e.response != null) {
        return UniversalData(error: e.response!.data);
      } else {
        return UniversalData(error: e.message!);
      }
    } catch (error) {
      return UniversalData(error: error.toString());
    }
  }

}
