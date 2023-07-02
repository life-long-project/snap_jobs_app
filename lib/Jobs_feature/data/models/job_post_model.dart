
import 'package:flutter/material.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';

class JobModel extends JobEntity {
  const JobModel({
    super.userId,
    required super.jobTitle,
    required super.jobDescription,
    required super.jobType,
    required super.salary,
    super.skills,
    super.isActive = false,
    super.workerId,
    super.duration,
    super.image,
    super.jobId = "0",
  });

  //TODO: add LOCATION and user id after backend finish
  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      jobId: (json['_id'] ?? "error") as String,
      // userId: '644e429ba22abc64180bcc02',
      jobTitle: (json['job_name'] ?? "error") as String,
      jobDescription: json['job_description'] as String,
      // workerId: "6462e25fff14a736805e1382",
      duration: ((json['job_duration'] ?? 0) is String)
          ? int.tryParse(json['job_duration']) ?? json['job_duration']
          : json['job_duration'],
      isActive: (json['is_active'] ?? false) as bool,

      jobType: (json['job_type'] ?? "service") == "part-time"
          ? JobType.partTime
          : json['job_type'] == "full-time"
              ? JobType.fullTime
              : JobType.service,
      salary: ((json['salary'] ?? 0) is String)
          ? int.tryParse(json['salary']) ?? json['salary']
          : json['salary'],
      skills: (json['skills'] ?? []),

      image:(json['job_img_url'] ?? []).map((e) => Image.network(e) ).toList(),



    );
  }

  Map<String, dynamic> toJson() {
    final jsonBody = {
      'title': jobTitle,
      'description': jobDescription,
      'skills':
      skills,
      'type': jobType.toString().split('.').last,
      'salary': salary.toString(),
      'location' : 'tanta'
    };

    if (duration != null) {
      jsonBody.addEntries([MapEntry('duration', duration.toString())]);
    }


    return jsonBody;
  }
}
