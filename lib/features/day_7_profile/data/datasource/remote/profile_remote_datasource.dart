import 'package:dio/dio.dart';
import 'package:riverpod_test/core/constants/app_constants.dart';
import 'package:riverpod_test/features/day_7_profile/data/model/profile_model.dart';

class ProfileRemoteDatasource {
  final Dio dio;

  ProfileRemoteDatasource(this.dio);

  Future<List<ProfileModel>> getProfileData() async {
    final res = await dio.get(AppConstants.userProfile);
    List<dynamic> data = res.data;

    return data.map((json) => ProfileModel.fromJson(json)).toList();
  }
}
