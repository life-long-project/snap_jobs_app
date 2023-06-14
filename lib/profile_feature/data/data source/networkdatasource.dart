//abstract class of base profile data source

import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:snap_jobs/core/network/base_http_client.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:snap_jobs/profile_feature/data/model/profile_get.dart';

import '../../../core/error/exceptions.dart';

import '../../../core/network/error_message_model.dart';
import '../../../core/utilities_and_theme/profileapi.dart';

abstract class BaseProfileDataSource {
  Future<ProfileModel> getProfile(String id);
  Future<Unit> postprofile(ProfileModel profileModel);
  Future<Unit> updaterofile(ProfileModel profileModel);
}

class ProfileDataSource extends BaseProfileDataSource {
  @override
  Future<ProfileModel> getProfile(String id) async {
    final response = await sl<BaseHttpClient>()
        .get(Uri.parse('${Profileconstant.profileUrl}/$id'),
         headers: {"Content-Type": "application/json"},);

    if (response.statusCode == 200) {
      return (ProfileModel.fromJson(jsonDecode(response.body)['data']));
    } else {
      throw ServerException(
        errorMessageModel:
            ErrorMessageModel.fromJson(jsonDecode(response.body)['data']),
      );
    }
  }

  @override
  Future<Unit> postprofile(ProfileModel profileModel) async {
    final Body = {
      "userName": profileModel.userName,
      "bio": profileModel.bio,
      "age": profileModel.age,
      "location": profileModel.location,
      "skills": profileModel.skills,
      "past_jobs": profileModel.pastJobs
    };
    try {
      await sl<BaseHttpClient>().post(Uri.parse(Profileconstant.profileUrl),body: Body);
      return Future.value(unit);
    } on ServerException catch (e, s) {
      stderr.writeln(e);
      stderr.writeln(s);
      throw Exception();
    }
  }

  @override
  Future<Unit> updaterofile(ProfileModel profileModel) async{
    final Body = {
      "userName": profileModel.userName,
      "bio": profileModel.bio,
      "age": profileModel.age,
      "location": profileModel.location,
      "skills": profileModel.skills,
      "past_jobs": profileModel.pastJobs
    };
    try {
      await sl<BaseHttpClient>().post(Uri.parse('${Profileconstant.profileUrl}/$id'),body: Body);
      return Future.value(unit);
    } on ServerException catch (e, s) {
      stderr.writeln(e);
      stderr.writeln(s);
      throw Exception();
    }


    
  }
}
