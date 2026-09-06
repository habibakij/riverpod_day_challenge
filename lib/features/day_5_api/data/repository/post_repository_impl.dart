import 'package:riverpod_test/features/day_5_api/data/datasource/remote/remote_datasource.dart';
import 'package:riverpod_test/features/day_5_api/domain/entities/post.dart';
import 'package:riverpod_test/features/day_5_api/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Post>> getPosts() async {
    return await remoteDataSource.getPosts();
  }
}
