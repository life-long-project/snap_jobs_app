import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/error/exceptions.dart';
import '../models/job_post_model.dart';

abstract class JobsLocalDataSource {
  Future<List<JobModel>> getCachedJobs();
  Future<Unit> cacheJobs(List<JobModel> postModels);
}

const cachedJobs = "CACHED_JOBS";

class JobsLocalDataSourceImpl implements JobsLocalDataSource {
  final SharedPreferences sharedPreferences;

  JobsLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheJobs(List<JobModel> postModels) {
    List postModelsToJson = postModels
        .map<Map<String, dynamic>>((postModel) => postModel.toJson())
        .toList();
    sharedPreferences.setString(cachedJobs, json.encode(postModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<JobModel>> getCachedJobs() {
    final jsonString = sharedPreferences.getString(cachedJobs);
    if (jsonString != null) {
      List decodeJsonData = json.decode(jsonString);
      List<JobModel> jsonToPostModels = decodeJsonData
          .map<JobModel>((jsonPostModel) => JobModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModels);
    } else {
      throw EmptyCacheException();
    }
  }
}
