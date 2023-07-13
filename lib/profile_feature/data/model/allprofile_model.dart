import 'package:flutter/foundation.dart';
import 'package:snap_jobs/Jobs_feature/data/models/job_post_model.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/profile_feature/domain/entities/allprofile.dart';
import 'package:snap_jobs/profile_feature/domain/entities/rating.dart';

class AllProfileModel extends AllProfile{
  AllProfileModel({required super.user,
   required super.userJobs, required super.rates}
   );



factory AllProfileModel.fromJson(Map<String, dynamic> json)=>AllProfileModel(
user:json['user'],
userJobs : json['user_jobs']  as List<JobEntity>,
rates:json['rates'] as List<Rating>,



);

}


