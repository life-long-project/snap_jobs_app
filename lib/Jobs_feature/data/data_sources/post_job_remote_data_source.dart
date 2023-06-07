import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:post_job/core/network/api_constants.dart';
import 'package:post_job/post_job_feature/domain/entities/post_job_entity.dart';

import '../../../core/error/exceptions.dart';
import '../models/job_post_model.dart';
import 'package:http/http.dart' as http;

abstract class PostJobRemoteDataSource {
  Future<List<JobPostModel>> getAllJobs();
  Future<Unit> deleteJob(String jobId);
  Future<Unit> updateJob(JobPostModel jobPostModel);
  Future<Unit> addJob(JobPostModel jobPostModel);
}

class PostJobRemoteDataSourceImpl extends PostJobRemoteDataSource {
  final http.Client client;

  PostJobRemoteDataSourceImpl({required this.client});
  @override
  Future<List<JobPostModel>> getAllJobs() async {
    final response = await client.get(
      Uri.parse(ApiConstants.getAllJobsPath),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final  decodedJson = json.decode(response.body)["jobs"]  ;
      final List<JobPostModel> jobModel = decodedJson
          .map<JobPostModel>(
              (jsonJobPostModel) => JobPostModel.fromJson(jsonJobPostModel))
          .toList();

      return jobModel;
    } else {
      throw ServerException();
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

    final response =
        await client.post(Uri.parse(ApiConstants.getAllJobsPath), body: body);

    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deleteJob(String jobId) async {
    final response = await client.delete(
      Uri.parse(ApiConstants.getAllJobsPath + jobId),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
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

    final response =
        await client.post(Uri.parse(ApiConstants.getAllJobsPath), body: body);

    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
