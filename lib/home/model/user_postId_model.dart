// To parse this JSON data, do
//
//     final userWithPostId = userWithPostIdFromJson(jsonString);

import 'dart:convert';

List<UserWithPostIdModel> userWithPostIdFromJson(String str) =>
    List<UserWithPostIdModel>.from(
        json.decode(str).map((x) => UserWithPostIdModel.fromJson(x)));

String userWithPostIdToJson(List<UserWithPostIdModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserWithPostIdModel {
  int postId;
  int id;
  String name;
  String email;
  String body;

  UserWithPostIdModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory UserWithPostIdModel.fromJson(Map<String, dynamic> json) =>
      UserWithPostIdModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}

class UserModel {
  List<UserWithPostIdModel>? userWithPostIdModel;
  String? error;
  UserModel({
    required this.userWithPostIdModel,
    required this.error,
  });
}
