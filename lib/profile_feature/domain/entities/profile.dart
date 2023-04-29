import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  //get one profile data
 const Profile({
    required this.isAdmin,
    required this.following,
    required this.skills,
    required this.feedBack,
    required this.pastJobs,
    required this.rateQuantity,
    required this.rateAverage,
    required this.userImageUrl,
    required this.workImageUrl,
    required this.isReported,
    required this.isBlocked,
    required this.sId,
    required this.createdAt,
    required this.updatedAt,
    required this.iV,
    required this.userName,
    required this.bio,
    required this.age,
    required this.location
  });
  
 final bool isAdmin;
  final bool following;
  final List<String> skills;
  final List<String> feedBack;
 final  List<String> pastJobs;
  final double rateQuantity;
 final double rateAverage;
 final String userImageUrl;
 final String workImageUrl;
 final bool isReported;
 final bool isBlocked;
 final String sId;

 final String createdAt;
 final String updatedAt;
 final int iV;
 final String userName;
 final String bio;
  final int age;
 final String location;

  @override
  List<Object?> get props => [
        isAdmin,
        following,
        skills,
        feedBack,
        pastJobs,
        rateQuantity,
        rateAverage,
        userImageUrl,
        workImageUrl,
        isReported,
        isBlocked,
        sId,
        createdAt,
        updatedAt,
        iV,
        userName,
        bio,
        age,
        location,
      ];
}
