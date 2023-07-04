import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/core/network/api_constants.dart';
import 'package:snap_jobs/core/network/base_http_client.dart';

import '../../../core/error/exceptions.dart';
import '../models/job_post_model.dart';

abstract class JobRemoteDataSource {
  Future<List<JobModel>> getAllJobs();
  Future<List<JobEntity>> getUserJobs(String userId);
  Future<JobEntity> getOneJob(String jobId);
  Future<Unit> deleteJob(String jobId);
  Future<Unit> updateJob(JobModel jobPostModel);
  Future<Unit> addJob(JobModel jobPostModel);
}

class PostJobRemoteDataSourceImpl extends JobRemoteDataSource {
  final BaseHttpClient client;

  PostJobRemoteDataSourceImpl({required this.client});

  //* get all jobs
  @override
  Future<List<JobModel>> getAllJobs() async {
    try {
      final response = await client.get(
        Uri.parse(ApiConstants.getAllJobsPath),
      );
      final decodedJson = json.decode(response.body)["jobs"];
      final List<JobModel> jobModel = decodedJson
          .map<JobModel>(
              (jsonJobPostModel) => JobModel.fromJson(jsonJobPostModel))
          .toList();

      return jobModel;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      stderr.writeln(e);
      stderr.writeln(s);

      throw OfflineException();
    }
  }

//* get one job
  @override
  Future<JobEntity> getOneJob(String jobId) async {
    try {
      final response = await client.get(
        Uri.parse(ApiConstants.getOneJobPath + jobId),
        headers: {"Content-Type": "application/json"},
      );
      final decodedJson = json.decode(response.body)[0];
      final JobModel jobModel = JobModel.fromJson(decodedJson);

      return jobModel;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      stderr.writeln(e);
      stderr.writeln(s);

      throw OfflineException();
    }
  }

//* get user jobs
  @override
  Future<List<JobEntity>> getUserJobs(String userId) async {
    //TODO :implement the right request after backend add fetaure

    try {
      final response = await client.get(
        Uri.parse(ApiConstants.getAllJobsPath),
        headers: {"Content-Type": "application/json"},
      );
      final decodedJson = json.decode(response.body)["jobs"];
      final List<JobModel> jobModel = decodedJson
          .map<JobModel>(
              (jsonJobPostModel) => JobModel.fromJson(jsonJobPostModel))
          .toList();

      return jobModel;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      stderr.writeln(e);
      stderr.writeln(s);

      throw OfflineException();
    }
  }
  //* add job

  @override
  Future<Unit> addJob(JobModel jobPostModel) async {
    final body = jobPostModel;
    try {
      await client.post(Uri.parse(ApiConstants.getAllJobsPath), body: body);
      return Future.value(unit);
    } on ServerException {
      rethrow;

    } catch (e, s) {
      stderr.writeln(e);
      stderr.writeln(s);

      throw OfflineException();
    }
  }

  //*delete job

  @override
  Future<Unit> deleteJob(String jobId) async {
    try {
      await client.delete(
        Uri.parse(ApiConstants.getAllJobsPath + jobId),
        headers: {"Content-Type": "application/json"},
      );
      return Future.value(unit);
    } on ServerException {
      rethrow;
    } catch (e, s) {
      stderr.writeln(e);
      stderr.writeln(s);

      throw OfflineException();
    }
  }

//* update job
  @override
  Future<Unit> updateJob(JobModel jobPostModel) async {
    final body = {
      'id': jobPostModel.jobId,
      'job_name': jobPostModel.jobTitle,
      'job_description': jobPostModel.jobDescription,
      'job_type': jobPostModel.jobType,
      'skills': const JsonEncoder().convert(jobPostModel.skills),
      'salary': jobPostModel.salary,
      'job_img_url': jobPostModel.image?.toString(),
    };
    try {
      await client.post(Uri.parse(ApiConstants.getAllJobsPath), body: body);
      return Future.value(unit);
    } on ServerException {
      rethrow;
    } catch (e, s) {
      stderr.writeln(e);
      stderr.writeln(s);

      throw OfflineException();
    }
  }
}
