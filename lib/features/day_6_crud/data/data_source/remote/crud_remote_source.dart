import 'package:dio/dio.dart';
import 'package:riverpod_test/core/constants/app_constants.dart';
import 'package:riverpod_test/features/day_6_crud/data/model/crud_model.dart';

class CrudRemoteSource {
  final Dio dio;

  CrudRemoteSource(this.dio);

  Future<List<CrudModel>> getPosts() async {
    final response = await dio.get(AppConstants.posts);
    final List<dynamic> data = response.data;

    return data.map((json) => CrudModel.fromJson(json)).toList();
  }

  Future<void> deletePost(int id) async {
    await dio.post("${AppConstants.deletePosts}$id");
  }
}
