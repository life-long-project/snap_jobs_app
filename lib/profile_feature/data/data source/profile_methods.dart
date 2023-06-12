//abstract class of base profile data source

import 'dart:convert';

import 'package:snap_jobs/core/network/base_http_client.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
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
    final response = await sl<BaseHttpClient>()
        .get(
          Uri.parse
          ('https://jobseeker-profile-api.onrender.com/profile/$id')
          );

    if (response.statusCode == 200) {
      return (ProfileModel.fromJson(jsonDecode(response.body)['data']));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(jsonDecode(response.body)['data']),
      );
    }
  }
}
