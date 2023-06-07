import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/error/exceptions.dart';
import '../models/job_post_model.dart';

abstract class JobsLocalDataSource {
  Future<List<JobPostModel>> getCachedJobs();
  Future<Unit> cacheJobs(List<JobPostModel> postModels);
}

const CACHED_Jobs = "CACHED_JOBS";

class JobsLocalDataSourceImpl implements JobsLocalDataSource {
  final SharedPreferences sharedPreferences;

  JobsLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheJobs(List<JobPostModel> postModels) {
    List postModelsToJson = postModels
        .map<Map<String, dynamic>>((postModel) => postModel.toJson())
        .toList();
    sharedPreferences.setString(CACHED_Jobs, json.encode(postModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<JobPostModel>> getCachedJobs() {
    final jsonString = sharedPreferences.getString(CACHED_Jobs);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<JobPostModel> jsonToPostModels = decodeJsonData
          .map<JobPostModel>((jsonPostModel) => JobPostModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
