import 'dart:convert';

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:snap_jobs/core/network/api_constants.dart';
import 'package:snap_jobs/core/network/base_http_client.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:snap_jobs/profile_feature/data/model/profilemodel.dart';

import '../../../core/error/exceptions.dart';

abstract class BaseProfileDataSource {
  Future<ProfileModel?> getoneProfile(String id);
  Future<Unit> postprofile(ProfileModel profileModel);
  Future<Unit> updaterofile(ProfileModel profileModel);
}

class NetworkDataSource extends BaseProfileDataSource {
  @override
  Future<ProfileModel?> getoneProfile(String id) async {
    final response = await sl<BaseHttpClient>().get(
      Uri.parse(ApiConstants.getprofileUrl + id),
      headers: {"Content-Type": "application/json"},
    );

    final result = ProfileModel.fromJson(jsonDecode(response.body)['data']);
    return (result);
  }

  @override
  Future<Unit> postprofile(ProfileModel profileModel) async {
    final body = {
      "userName": profileModel.userName,
      "bio": profileModel.bio,
      "age": profileModel.age,
      "location": profileModel.location,
      "skills": profileModel.skills,
      "past_jobs": profileModel.pastJobs
    };

    //this create profile depend on signup and usermodel not req
    await sl<BaseHttpClient>()
        .post(Uri.parse(ApiConstants.profileUrl), body: body);
    return Future.value(unit);
  }

  @override
  Future<Unit> updaterofile(ProfileModel profileModel) async {
    final body = {
      "userName": profileModel.userName,
      "bio": profileModel.bio,
      "age": profileModel.age,
      "location": profileModel.location,
      "skills": profileModel.skills,
      "past_jobs": profileModel.pastJobs
    };
    try {
      //check url
      await sl<BaseHttpClient>()
          .patch(Uri.parse(ApiConstants.getprofileUrl), body: body);
      return Future.value(unit);
    } on ServerException catch (e, s) {
      stderr.writeln(e);
      stderr.writeln(s);
      throw Error();
    }
  }
}
