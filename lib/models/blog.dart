

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
}