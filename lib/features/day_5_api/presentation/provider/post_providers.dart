import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/core/network/api_client.dart';
import 'package:riverpod_test/features/day_5_api/data/datasource/remote/remote_datasource.dart';
import 'package:riverpod_test/features/day_5_api/data/repository/post_repository_impl.dart';
import 'package:riverpod_test/features/day_5_api/domain/entities/post.dart';
import 'package:riverpod_test/features/day_5_api/domain/repositories/post_repository.dart';

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

final postsProvider = FutureProvider<List<Post>>((ref) async {
  final repository = ref.watch(postRepositoryProvider);

  return repository.getPosts();
});
