

class BlogModel {
  int? id;
  String? thumbnailUrl;
  String? title;

  BlogModel({
    this.id,
    this.thumbnailUrl,
    this.title
  });

  BlogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    thumbnailUrl = json['thumbnailUrl'];
    title = json['title'];
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogModel && runtimeType == other.runtimeType && id == other.id;
}