import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/core/network/api_client.dart';
import 'package:riverpod_test/features/day_6_async_network/data/datasource/remote/remote_datasource.dart';
import 'package:riverpod_test/features/day_6_async_network/data/repository/post_repository_impl.dart';
import 'package:riverpod_test/features/day_6_async_network/domain/entities/post.dart';
import 'package:riverpod_test/features/day_6_async_network/domain/repositories/post_repository.dart';

final dioProvider = Provider<Dio>((ref) {
  return ApiClient().dio;
});

final postRemoteDataSourceProvider = Provider<PostRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);

  return PostRemoteDataSource(dio);
});

final postRepositoryProvider = Provider<PostRepository>((ref) {
  final remoteDataSource = ref.watch(postRemoteDataSourceProvider);

  return PostRepositoryImpl(remoteDataSource);
});

class PostNotifier extends AsyncNotifier<List<Post>> {
  late final PostRepository _repository;

  @override
  Future<List<Post>> build() async {
    _repository = ref.watch(postRepositoryProvider);

    return await _repository.getPosts();
  }
}

final postNotifierProvider = AsyncNotifierProvider<PostNotifier, List<Post>>(PostNotifier.new);
