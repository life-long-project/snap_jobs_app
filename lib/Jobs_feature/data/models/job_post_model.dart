import 'package:flutter/material.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/offers_feature/data/models/offer_model.dart';
import 'package:snap_jobs/offers_feature/domain/entities/offer_entity.dart';

class JobModel extends JobEntity {
   JobModel({
    super.userId,
    super.userName,
    required super.dateTime,
    required super.jobTitle,
    super.offers,
    required super.jobDescription,
    required super.jobType,
    required super.salary,
    super.skills,
    super.isActive = false,
    super.isFinished = true,
    super.workerId,
    super.duration,
    required super.image,
    super.jobId = "0",
  });

  //TODO: add LOCATION and user id after backend finish
  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      // userName: (((json["user"]['f_name']) + " " + (json["user"]?['l_name'])) ?? "error")
      //     as String,
      userName:
          (json["user"]["f_name"] + " " + json["user"]["l_name"]) as String,

      userId: (json["posted_by_id"] ?? "error") as String,
      offers: json["offers"]?.isEmpty ?? true
          ?null
          : json["offers"].map<OfferEntity>((value) => OfferModel.fromJson(value).toEntity()).toList()
 ,

      dateTime: DateTime.parse(json['createdAt'] as String),

      jobId: (json['_id'] ?? "error") as String,
      // userId: '644e429ba22abc64180bcc02',
      jobTitle: (json['job_name'] ?? "error") as String,
      jobDescription: json['job_description'] as String,
      // workerId: "6462e25fff14a736805e1382",
      duration: ((json['job_duration'] ?? 0) is String)
          ? int.tryParse(json['job_duration']) ?? json['job_duration']
          : json['job_duration'],
      isActive: (json['is_active'] ?? false) as bool,
      isFinished: (json['is_finished'] ?? true) as bool,

      jobType: (json['job_type'] ?? "service") == "part-time"
          ? JobType.partTime
          : json['job_type'] == "full-time"
              ? JobType.fullTime
              : JobType.service,
      salary: ((json['salary'] ?? 0) is String)
          ? int.tryParse(json['salary']) ?? json['salary']
          : json['salary'],
      skills: (json['skills'] ?? []),

      image: (json['job_img_url'] ?? []).isEmpty
          ? <String>[]
          : [json['job_img_url']],
    );
  }

  Map<String, dynamic> toJson() {
    final jsonBody = {
      'title': jobTitle,
      'description': jobDescription,
      'skills': skills,
      'type': jobType.toString().split('.').last,
      'salary': salary.toString(),
      'location': 'tanta'
    };

    if (duration != null) {
      jsonBody.addEntries([MapEntry('duration', duration.toString())]);
    }

    return jsonBody;
  }
}
