// import 'knowledge_model.dart';
import 'organic_model.dart';
import 'search_param_model.dart';

class GoogleSearchModel {
  final SearchParameterModel searchParameterModel;
  // final KnowledgeModel knowledgeModel;
  final List<OrganicModel> organics;

  GoogleSearchModel(
      {required this.searchParameterModel,
      // required this.knowledgeModel,
      required this.organics});

  factory GoogleSearchModel.fromJson(Map<String, dynamic> json) {
    return GoogleSearchModel(
        searchParameterModel: SearchParameterModel.fromJson(json["searchParameters"]),
        // knowledgeModel: KnowledgeModel.fromJson(json["knowledgeGraph"]),
        organics: (json["organic"]as List?)?.map((e) => OrganicModel.fromJson(e)).toList() ?? []);
  }
}
