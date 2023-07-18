import 'package:flutter_defualt_project/data/models/google_search/google_search_model.dart';
import 'package:flutter_defualt_project/data/network/api_provider.dart';

import '../models/universal_response.dart';

class ApiRepository {
  final ApiProvider apiProvider;

  ApiRepository({required this.apiProvider});

  Future<GoogleSearchModel> getSearchData(
      {required String query, required int page, required int count}) async {
    UniversalResponse universalResponse = await apiProvider.searchFromGoogle(
        query: query, page: page, count: count);
    return universalResponse.data as GoogleSearchModel;
  }
}
