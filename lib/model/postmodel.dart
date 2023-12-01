import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((X) => Post.fromJson(X)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post({
    this.body,
    this.id,
    this.userId,
    this.title,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
      "userId" : userId,
      "id": id,
      "title": title,
      "body": body,
    };
  }

