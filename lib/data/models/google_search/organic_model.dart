class OrganicModel {
  final String title;
  final String link;
  final String snippet;
  final String imageUrl;
  final int position;

  OrganicModel(
      {required this.title,
      required this.link,
      required this.snippet,
      required this.imageUrl,
      required this.position});

  factory OrganicModel.fromJson(Map<String, dynamic> json) {
    return OrganicModel(
        title: json["title"] as String? ?? "",
        link: json["link"] as String? ?? "",
        snippet: json["snippet"] as String? ?? "",
        imageUrl: json["imageUrl"] as String? ?? "",
        position: json["position"] as int? ?? 0);
  }
}
