import 'package:riverpod_test/features/day_7_profile/domain/entity/profile_entity.dart';

abstract class ProfileRepository {
  Future<List<ProfileEntity>> getProfile();
}
