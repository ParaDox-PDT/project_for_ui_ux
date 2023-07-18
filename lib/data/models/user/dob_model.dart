class DobModel {
  final String date;
  final int age;

  DobModel({required this.date, required this.age});

  factory DobModel.fromJson(Map<String, dynamic> json) {
    return DobModel(
        date: json["date"] as String? ?? "", age: json["age"] as int? ?? 0);
  }
}
