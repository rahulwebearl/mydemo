// step 1 create model for json data

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  Welcome({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
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
