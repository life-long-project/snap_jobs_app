import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:snap_jobs/core/network/api_constants.dart';
import 'package:snap_jobs/core/network/base_http_client.dart';
import 'package:snap_jobs/core/network/error_message_model.dart';

import '../../../core/error/exceptions.dart';
import '../models/job_post_model.dart';

abstract class PostJobRemoteDataSource {
  Future<List<JobPostModel>> getAllJobs();
  Future<Unit> deleteJob(String jobId);
  Future<Unit> updateJob(JobPostModel jobPostModel);
  Future<Unit> addJob(JobPostModel jobPostModel);
}

class PostJobRemoteDataSourceImpl extends PostJobRemoteDataSource {
  final BaseHttpClient client;

  PostJobRemoteDataSourceImpl({required this.client});
  @override
  Future<List<JobPostModel>> getAllJobs() async {
    try {
      final response = await client.get(
        Uri.parse(ApiConstants.getAllJobsPath),
        headers: {"Content-Type": "application/json"},
      );
      final decodedJson = json.decode(response.body)["jobs"];
      final List<JobPostModel> jobModel = decodedJson
          .map<JobPostModel>(
              (jsonJobPostModel) => JobPostModel.fromJson(jsonJobPostModel))
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

  @override
  Future<Unit> addJob(JobPostModel jobPostModel) async {
    final body = {
      '_id': jobPostModel.jobId,
      'job_name': jobPostModel.jobName,
      'job_description': jobPostModel.jobDescription,
      'job_type': jobPostModel.jobType,
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

  @override
  Future<Unit> updateJob(JobPostModel jobPostModel) async {
    final body = {
      'id': jobPostModel.jobId,
      'job_name': jobPostModel.jobName,
      'job_description': jobPostModel.jobDescription,
      'job_type': jobPostModel.jobType,
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
