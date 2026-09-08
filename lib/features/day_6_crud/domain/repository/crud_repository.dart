import 'package:riverpod_test/features/day_6_crud/domain/entity/crud_entity.dart';

abstract class CrudRepository {
  Future<List<CrudEntity>> getPostList();

  Future<void> deletePost(int id);
}
