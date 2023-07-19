import 'dart:convert';

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:snap_jobs/core/network/api_constants.dart';
import 'package:snap_jobs/core/network/base_http_client.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:snap_jobs/profile_feature/data/model/profile_model.dart';
import 'package:snap_jobs/rate_feature/data/models/rate_model.dart';
import 'package:user_repository/user_repository.dart';

import '../../../core/error/exceptions.dart';

abstract class BaseProfileDataSource {
  Future<ProfileModel?> getOneProfile(String id);

  Future<Unit> updateProfile(User profileModel);
  Future<Unit> postJobRating(RateModel rateModel);
}

class ProfileRemoteDataSource extends BaseProfileDataSource
{
  @override
  Future<ProfileModel?> getOneProfile(String id) async {
    final response = await sl<BaseHttpClient>().get(
      Uri.parse(ApiConstants.getProfile + id),
      headers: {"Content-Type": "application/json"},
    );

    final result = ProfileModel.fromJson(jsonDecode(response.body));
    return (result);
  }

  @override
  Future<Unit> updateProfile(User profileModel) async {
    try {
      //TODO not the right implementation yet
      await sl<BaseHttpClient>()
          .patch(Uri.parse(ApiConstants.getProfile), body: profileModel);
      return Future.value(unit);
    } on ServerException catch (e, s) {
      stderr.writeln(e);
      stderr.writeln(s);
      throw Error();
    }
  }

  // @override
  // Future<Unit> PostUserRating(RateModel rateModel) async {
  //   try {
  //     //check url
  //     await sl<BaseHttpClient>().post(Uri.parse(ApiConstants.postUserRating),
  //         body: rateModel.toJson());
  //     return Future.value(unit);
  //   } on ServerException catch (e, s) {
  //     stderr.writeln(e);
  //     stderr.writeln(s);
  //     throw Error();
  //   }
  // }

  @override
  Future<Unit> postJobRating(RateModel rateModel) async {
    try {
      //check url
      await sl<BaseHttpClient>().post(Uri.parse(ApiConstants.postJobRating),
          body: rateModel.toJson());
      return Future.value(unit);
    } on ServerException catch (e, s) {
      stderr.writeln(e);
      stderr.writeln(s);
      throw Error();
    }
  }


}
