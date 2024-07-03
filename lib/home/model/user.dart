// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    int userId;
    int id;
    String title;
    String body;
    String? author;

    User({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
        this.author
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
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


class UserListModel {
  List<User>? book;
  String? error;
  UserListModel({
    required this.book,
    required this.error,
  });
}
