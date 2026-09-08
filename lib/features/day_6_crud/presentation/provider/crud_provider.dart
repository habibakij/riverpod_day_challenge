import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/core/network/api_client.dart';
import 'package:riverpod_test/features/day_6_crud/data/data_source/remote/crud_remote_source.dart';
import 'package:riverpod_test/features/day_6_crud/data/repository_imp/crud_repository_impl.dart';
import 'package:riverpod_test/features/day_6_crud/domain/entity/crud_entity.dart';
import 'package:riverpod_test/features/day_6_crud/domain/repository/crud_repository.dart';

final dioProvider = Provider<Dio>((ref) {
  return ApiClient().dio;
});

final dataSourceProvider = Provider<CrudRemoteSource>((ref) {
  final dio = ref.watch(dioProvider);
  return CrudRemoteSource(dio);
});

final repositoryProvider = Provider<CrudRepository>((ref) {
  final dataSource = ref.watch(dataSourceProvider);
  return CrudRepositoryImpl(dataSource);
});

class CrudNotifier extends AsyncNotifier<List<CrudEntity>> {
  late CrudRepository _crudRepository;

  @override
  FutureOr<List<CrudEntity>> build() {
    _crudRepository = ref.watch(repositoryProvider);
    return _crudRepository.getPostList();
  }

  void updateTodo(int id) {}

  Future<void> deleteTodo(int id) async {
    final previousData = state;

    state = AsyncLoading();

    state = await AsyncValue.guard(() async {
      await _crudRepository.deletePost(id);

      return previousData.value!.where((todo) => todo.id != id).toList();
    });
  }
}

final crudProvider = AsyncNotifierProvider<CrudNotifier, List<CrudEntity>>(CrudNotifier.new);
