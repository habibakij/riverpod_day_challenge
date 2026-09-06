import 'package:riverpod_test/features/day_5_api/domain/entities/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPosts();
}
