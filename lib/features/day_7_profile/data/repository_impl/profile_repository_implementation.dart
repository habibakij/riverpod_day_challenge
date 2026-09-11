import 'package:riverpod_test/features/day_7_profile/data/datasource/remote/profile_remote_datasource.dart';
import 'package:riverpod_test/features/day_7_profile/domain/entity/profile_entity.dart';
import 'package:riverpod_test/features/day_7_profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImplementation extends ProfileRepository {
  final ProfileRemoteDatasource _profileRemoteDatasource;

  ProfileRepositoryImplementation(this._profileRemoteDatasource);

  @override
  Future<List<ProfileEntity>> getProfile() {
    return _profileRemoteDatasource.getProfileData();
  }
}
