import 'package:dio/dio.dart';
import 'package:riverpod_test/core/constants/app_constants.dart';
import 'package:riverpod_test/features/day_6_async_network/data/model/post_model.dart';

class PostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSource(this.dio);

  Future<List<PostModel>> getPosts() async {
    final response = await dio.get(AppConstants.posts);
    final List<dynamic> data = response.data;

    return data.map((json) => PostModel.fromJson(json)).toList();
  }

  // POST
  Future<PostModel> createPost({
    required String title,
    required String body,
    required int userId,
  }) async {
    final response = await dio.post(
      AppConstants.posts,
      data: {'title': title, 'body': body, 'userId': userId},
    );
    return PostModel.fromJson(response.data);
  }

  // DELETE
  Future<void> deletePost(int id) async {
    await dio.delete('${AppConstants.posts}/$id');
  }
}
