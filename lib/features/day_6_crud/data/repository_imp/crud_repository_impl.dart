import 'package:riverpod_test/features/day_6_crud/data/data_source/remote/crud_remote_source.dart';
import 'package:riverpod_test/features/day_6_crud/domain/entity/crud_entity.dart';
import 'package:riverpod_test/features/day_6_crud/domain/repository/crud_repository.dart';

class CrudRepositoryImpl extends CrudRepository {
  final CrudRemoteSource _crudRemoteSource;

  CrudRepositoryImpl(this._crudRemoteSource);

  @override
  Future<List<CrudEntity>> getPostList() async {
    return await _crudRemoteSource.getPosts();
  }

  @override
  Future<void> deletePost(int id) async {
    return await _crudRemoteSource.deletePost(id);
  }
}
