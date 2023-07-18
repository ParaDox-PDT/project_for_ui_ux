class RegisteredModel {
  final String date;
  final int age;

  RegisteredModel({required this.date, required this.age});

  factory RegisteredModel.fromJson(Map<String, dynamic> json) {
    return RegisteredModel(
        date: json["date"] as String? ?? "", age: json["age"] as int? ?? 0);
  }
}
