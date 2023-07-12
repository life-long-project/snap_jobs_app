import 'dart:convert';

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:snap_jobs/core/network/api_constants.dart';
import 'package:snap_jobs/core/network/base_http_client.dart';
import 'package:snap_jobs/core/services/services_locator.dart';
import 'package:snap_jobs/profile_feature/data/model/usermodel.dart';

import '../../../core/error/exceptions.dart';
import '../model/rating_model.dart';

abstract class BaseProfileDataSource {
  Future<UserModel?> getoneProfile(String id);

  Future<Unit> updaterofile(UserModel profileModel);
  Future<Unit> PostRating(RatingModel ratingmodel);
}

class NetworkDataSource extends BaseProfileDataSource {
  @override
  Future<UserModel?> getoneProfile(String id) async {
    final response = await sl<BaseHttpClient>().get(
      Uri.parse(ApiConstants.getprofileUrl + id),
      headers: {"Content-Type": "application/json"},
    );

    final result = UserModel.fromJson(jsonDecode(response.body)['data']);
    return (result);
  }

  @override
  Future<Unit> updaterofile(UserModel profileModel) async {
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

  @override
  Future<Unit> PostRating(RatingModel ratingmodel) async {
    final body = {
      "rating": ratingmodel.rating,
      "feedback": ratingmodel.feedback
    };
    try {
      //check url
      await sl<BaseHttpClient>()
          .post(Uri.parse(ApiConstants.postratingUrl), body: body);
      return Future.value(unit);
    } on ServerException catch (e, s) {
      stderr.writeln(e);
      stderr.writeln(s);
      throw Error();
    }
  }
}
