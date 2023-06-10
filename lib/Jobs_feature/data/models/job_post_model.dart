import 'package:flutter/material.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/post_job_entity.dart';

class JobPostModel extends JobPost {
  const JobPostModel({
    required super.jobId,
    required super.jobName,
    required super.jobDescription,
    required super.jobType,
    required super.salary,
    required super.image,
  });
  factory JobPostModel.fromJson(Map<String, dynamic> json) {
    return JobPostModel(
      jobId: (json['_id'] ?? "") as String,
      jobName: (json['job_name'] ?? "") as String,
      jobDescription: json['job_description'] as String,
      jobType: json['job_type'] as String,
      salary: (json['salary'] is String)
          ? int.tryParse(json['salary']) ?? json['salary']
          : json['salary'],
      image: json['job_img_url'] != null
          ? Image.network(json['job_img_url'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': jobId,
      'job_name': jobName,
      'job_description': jobDescription,
      'job_type': jobType,
      'salary': salary,
      'job_img_url': image?.toString(),
    };
  }
}
