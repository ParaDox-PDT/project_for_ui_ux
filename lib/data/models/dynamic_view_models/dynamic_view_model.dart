class DynamicViewModel {
  // "title": "Just Square",
  // "sort": 1,
  // "group": "COMMON",
  // "width": 200,
  // "height": 200,
  // "color": "#000000",
  // "type": "container"
  final String title;
  final int sort;
  final String group;
  final int width;
  final int height;
  final String color;
  final String type;

  DynamicViewModel(
      {required this.title,
      required this.sort,
      required this.color,
      required this.group,
      required this.height,
      required this.type,
      required this.width});

  factory DynamicViewModel.fromJson(Map<String, dynamic> json) {
    return DynamicViewModel(
        title: json["title"] as String? ?? "",
        sort: json["sort"] as int? ?? 0,
        color: json["color"] as String? ?? "",
        group: json["group"] as String? ?? "",
        height: json["height"] as int? ?? 0,
        type: json["type"] as String? ?? "",
        width: json["width"] as int? ?? 0);
  }
}
