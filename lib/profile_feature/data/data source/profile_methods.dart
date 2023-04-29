//abstract class of base profile data source

import 'package:dio/dio.dart';
import 'package:snap_jobs/profile_feature/data/model/profile_get.dart';

import '../../../core/error/exceptions.dart';

import '../../../core/network/error_message_model.dart';

abstract class BaseProfileDataSource {
  Future<ProfileModel> getProfile(String id);
}

class ProfileDataSource extends BaseProfileDataSource {
  @override
  Future<ProfileModel> getProfile(String id) async {
//get request using dio
    final response = await Dio()
        .get('https://jobseeker-profile-api.onrender.com/profile/$id');

    if (response.statusCode == 200) {
      return (ProfileModel.fromJson(response.data['data']));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
