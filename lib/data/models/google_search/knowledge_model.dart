class KnowledgeModel {
  final String title;
  final String type;
  final String website;
  final String imageUrl;
  final String description;
  final String descriptionSource;
  final String descriptionLink;

  KnowledgeModel(
      {required this.title,
      required this.type,
      required this.description,
      required this.descriptionLink,
      required this.descriptionSource,
      required this.imageUrl,
      required this.website});

  factory KnowledgeModel.fromJson(Map<String, dynamic> json) {
    return KnowledgeModel(
        title: json["title"] as String? ?? "",
        type: json["type"] as String? ?? "",
        description: json["description"] as String? ?? "",
        descriptionLink: json["descriptionLink"] as String? ?? "",
        descriptionSource: json["descriptionSource"] as String? ?? "",
        imageUrl: json["imageUrl"] as String? ?? "",
        website: json["website"] as String? ?? "");
  }

}
