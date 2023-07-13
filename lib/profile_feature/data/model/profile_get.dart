import 'package:snap_jobs/profile_feature/domain/entities/allprofile.dart';
import 'package:snap_jobs/profile_feature/domain/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel(
      {required super.isAdmin,
      required super.following,
      required super.skills,
      required super.feedBack,
      required super.pastJobs,
      required super.rateQuantity,
      required super.rateAverage,
      required super.userImageUrl,
      required super.workImageUrl,
      required super.isReported,
      required super.isBlocked,
      required super.sId,
      required super.createdAt,
      required super.updatedAt,
      required super.iV,
      required super.userName,
      required super.bio,
      required super.age,
      required super.location});

// create factory constructor
  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        isAdmin: json['is_admin'],
        following: json['following'],
        skills: json['skills'].cast<String>(),
        feedBack: json['feed_back'],
        pastJobs: json['past_jobs'],
        rateQuantity: json['rate_quantity'],
        rateAverage: json['rate_average'],
        userImageUrl: json['user_image_url'],
        workImageUrl: json['work_image_url'],
        isReported: json['is_reported'],
        isBlocked: json['is_blocked'],
        sId: json['_id'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        iV: json['__v'],
        age: json['age'],
        bio: json['bio'],
        location: json['location'],
        userName: json['user_name'],
      );
}
