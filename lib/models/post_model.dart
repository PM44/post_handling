class PostModel {
  PostModel({
      required this.userId,
      required this.id,
      required this.title,
      required this.body,});

  PostModel.fromJson(dynamic json) {
    userId = json['userId']??'';
    id = json['id']??'';
    title = json['title']??'';
    body = json['body']??'';
  }
  int? userId;
  int? id;
  String? title;
  String? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    return map;
  }

}