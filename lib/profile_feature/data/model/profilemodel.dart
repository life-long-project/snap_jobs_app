import 'package:snap_jobs/profile_feature/domain/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel(
      {
      required super.skills,
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
  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
       
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
