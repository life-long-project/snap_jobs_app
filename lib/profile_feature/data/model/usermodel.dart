import 'package:snap_jobs/profile_feature/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.skills,
      required super.feedBack,
      required super.pastJobs,
      required super.rateQuantity,
      required super.rating,
      required super.userImageUrl,
      required super.workImageUrl,
      required super.sId,
      required super.userName,
      required super.bio,
      required super.age,
      required super.location});

// create factory constructor
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        skills: json['skills'].cast<String>(),
        feedBack: json['feed_back'],
        pastJobs: json['past_jobs'],
        rateQuantity: json['rate_quantity'],
        rating: json['rating'],
        userImageUrl: json['user_image_url'],
        workImageUrl: json['work_image_url'],
        sId: json['_id'],
        age: json['age'],
        bio: json['"past_experience'],
        location: json['location'],
        userName: json['full_name'],
      );
}
