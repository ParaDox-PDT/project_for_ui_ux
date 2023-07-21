import 'package:flutter_defualt_project/data/models/users/user_model.dart';
import 'package:flutter_defualt_project/data/network/api_provider.dart';

import '../models/universal_response.dart';

class ApiRepository {
  final ApiProvider apiProvider;

  ApiRepository({required this.apiProvider});

  Future<List<UserModel>> getUsers(
      { required int page, required int count}) async {
    UniversalResponse universalResponse = await apiProvider.getAllUser(page: page, count: count);
    return universalResponse.data as List<UserModel>;
  }
}
