import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/core/network/api_client.dart';
import 'package:riverpod_test/features/day_7_profile/data/datasource/remote/profile_remote_datasource.dart';
import 'package:riverpod_test/features/day_7_profile/data/repository_impl/profile_repository_implementation.dart';
import 'package:riverpod_test/features/day_7_profile/domain/entity/profile_entity.dart';
import 'package:riverpod_test/features/day_7_profile/domain/repository/profile_repository.dart';

final dioProvider = Provider<Dio>((ref) {
  return ApiClient().dio;
});

final profileRemoteDataSourceProvider = Provider<ProfileRemoteDatasource>((ref) {
  final dio = ref.watch(dioProvider);
  return ProfileRemoteDatasource(dio);
});

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final dataSourceProvider = ref.watch(profileRemoteDataSourceProvider);
  return ProfileRepositoryImplementation(dataSourceProvider);
});

class ProfileNotifier extends AsyncNotifier<List<ProfileEntity>> {
  late ProfileRepository _profileRepository;

  @override
  FutureOr<List<ProfileEntity>> build() {
    _profileRepository = ref.watch(profileRepositoryProvider);
    return _profileRepository.getProfile();
  }
}

final profileProvider = AsyncNotifierProvider<ProfileNotifier, List<ProfileEntity>>(
  ProfileNotifier.new,
);
