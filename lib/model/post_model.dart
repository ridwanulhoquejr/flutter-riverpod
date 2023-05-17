// To parse this JSON data, do
//
//     final samplePosts = samplePostsFromJson(jsonString);

import 'dart:convert';

List<SamplePosts> samplePostsFromJson(String str) => List<SamplePosts>.from(
    json.decode(str).map((x) => SamplePosts.fromJson(x)));

String samplePostsToJson(List<SamplePosts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SamplePosts {
  final int userId;
  final int id;
  final String title;
  final String body;

  SamplePosts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  SamplePosts copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) =>
      SamplePosts(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
      );

  factory SamplePosts.fromJson(Map<String, dynamic> json) => SamplePosts(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
