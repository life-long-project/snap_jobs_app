import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/error_message_model.dart';
import '../../../core/network/api_constants.dart';
import '../../domain/use_case/search_use_case.dart';
import '../model/job_model.dart';

abstract class BaseDataSource {
  Future<List<JobsModel>> getAllJobs();
  Future<List<JobsModel>> getJobsByName(String parameters);
  Future<void> deleteJobs(String id);
}

class DataSource extends BaseDataSource {
  @override
  Future<List<JobsModel>> getAllJobs() async {
    final response = await Dio().get(ApiConstants.getAllJobsPath);
    if (response.statusCode == 200) {
      return List<JobsModel>.from((response.data["jobs"] as List).map(
        (e) => JobsModel.fromJson(e),
      ));
    } else {
      // throw Exception(response.data['"message']);
      // return message only of error mdeljobs
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<JobsModel>> getJobsByName(String parameters) async {
    final response = await Dio().get('$ApiConstants.searchJobsPath$parameters');

    if (response.statusCode == 200) {
      return List<JobsModel>.from((response.data["jobs"] as List).map(
        (e) => JobsModel.fromJson(e),
      ));
    } else {
      // throw Exception(response.data['"message']);
      // return message only of error mdeljobs
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  //dio delete api
  @override
  Future<void> deleteJobs(String id) async {
    final response = await Dio().delete('$ApiConstants.deleteJobPath$id');
    if (response.statusCode == 200) {
      return;
    } else {
      // throw Exception(response.data['"message']);
      // return message only of error mdeljobs

      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
//dio update api
  // @override
  // Future<void> updateJobs(JobsModel jobsModel) async {
  //   final response = await Dio().put(
  //     'http://back-ph2h.onrender.com/jobs/${jobsModel.id}',
  //     data: JobsModel(
  //       //TODO:CREATE NEWMODEL OF UPDATE
  //       id: jobsModel.id,
  //       title: jobsModel.title,
  //       description: jobsModel.description,
  //       salary: jobsModel.salary,
  //       location: jobsModel.location,
  //       company: jobsModel.company,
  //       type: jobsModel.type,
  //       experience: jobsModel.experience,
  //       skills: jobsModel.skills,

  //)
  // );
  // if (response.statusCode == 200) {
  //   return;
  // } else {
  //   // throw Exception(response.data['"message']);
  //   // return message only of error mdeljobs
  //   throw ServerException(
  //     errorMessageModel: ErrorMessageModel.fromJson(response.data),
  //   );
  // }
}
