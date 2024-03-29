class BlogModel {
  late int id;
 late String title;
late  String description;
 late String imageUrl;
 late String createdAt;
 late String updatedAt;

  BlogModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.createdAt,
      required this.updatedAt});

  BlogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
