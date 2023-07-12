import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:snap_jobs/Jobs_feature/data/models/job_post_model.dart';
import 'package:snap_jobs/profile_feature/domain/entities/rating.dart';
import 'package:snap_jobs/profile_feature/domain/entities/user.dart';

class AllProfile extends Equatable {
  //all models that may use from other feature
  final User user;
  final List<JobPostModel> userJobs;

  final List? acceptedJobs;
  final List<Rating> rates;

  const AllProfile(
      {required this.user,
       required this.userJobs,
        this.acceptedJobs, required this.rates});

  @override
  List<Object?> get props => [user, userJobs, acceptedJobs, rates];
}
