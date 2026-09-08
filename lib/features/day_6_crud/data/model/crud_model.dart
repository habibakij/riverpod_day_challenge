import 'package:riverpod_test/features/day_6_crud/domain/entity/crud_entity.dart';

class CrudModel extends CrudEntity {
  const CrudModel({
    required super.id,
    required super.userID,
    required super.title,
    required super.body,
  });

  factory CrudModel.fromJson(Map<String, dynamic> json) {
    return CrudModel(
      id: json['id'] ?? 0,
      userID: json['userId'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'userId': userID, 'title': title, 'body': body};
  }
}
