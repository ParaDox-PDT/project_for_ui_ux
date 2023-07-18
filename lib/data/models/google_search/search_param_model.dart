class SearchParameterModel {
  final String q;
  final int number;
  final int page;
  final String type;

  SearchParameterModel(
      {required this.q,
      required this.number,
      required this.page,
      required this.type});

  factory SearchParameterModel.fromJson(Map<String, dynamic> json) {
    return SearchParameterModel(
        q: json["q"] as String? ?? "",
        number: json["num"] as int? ?? 0,
        page: json["page"] as int? ?? 0,
        type: json["type"] as String? ?? "");
  }
}
