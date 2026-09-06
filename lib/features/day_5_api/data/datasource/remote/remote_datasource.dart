import 'package:dio/dio.dart';
import 'package:riverpod_test/core/constants/app_constants.dart';
import 'package:riverpod_test/features/day_5_api/data/model/post_model.dart';

class PostRemoteDataSource {
  final Dio dio;

  PostRemoteDataSource(this.dio);

  Future<List<PostModel>> getPosts() async {
    final response = await dio.get(AppConstants.posts);
    final List<dynamic> data = response.data;

    return data.map((json) => PostModel.fromJson(json)).toList();
  }
}
