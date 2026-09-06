import 'package:riverpod_test/features/day_6_async_network/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();

  Future<Post> createPost({required String title, required String body, required int userId});

  Future<void> deletePost(int id);
}
