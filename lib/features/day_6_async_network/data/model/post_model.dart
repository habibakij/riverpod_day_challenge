// List<PostModel> postModelFromJson(String str) =>
//     List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));
//
// String postModelToJson(List<PostModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class PostModel {
//   final int? userId;
//   final int? id;
//   final String? title;
//   final String? body;
//
//   PostModel({this.userId, this.id, this.title, this.body});
//
//   factory PostModel.fromJson(Map<String, dynamic> json) =>
//       PostModel(userId: json["userId"], id: json["id"], title: json["title"], body: json["body"]);
//
//   Map<String, dynamic> toJson() => {"userId": userId, "id": id, "title": title, "body": body};
// }

import 'package:riverpod_test/features/day_6_async_network/domain/entities/post.dart';

class PostModel extends Post {
  const PostModel({
    required super.userId,
    required super.id,
    required super.title,
    required super.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'id': id, 'title': title, 'body': body};
  }
}
