import 'package:riverpod_test/features/day_6_async_network/data/datasource/remote/remote_datasource.dart';
import 'package:riverpod_test/features/day_6_async_network/domain/entities/post.dart';
import 'package:riverpod_test/features/day_6_async_network/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Post>> getPosts() async {
    return await remoteDataSource.getPosts();
  }

  @override
  Future<Post> createPost({
    required String title,
    required String body,
    required int userId,
  }) async {
    return await remoteDataSource.createPost(title: title, body: body, userId: userId);
  }

  @override
  Future<void> deletePost(int id) async {
    await remoteDataSource.deletePost(id);
  }
}
