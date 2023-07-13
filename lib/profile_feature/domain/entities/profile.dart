import 'package:equatable/equatable.dart';

abstract class Profile extends Equatable {
  final bool isAdmin;
  final List<String> skills;
  final List<dynamic> feedBack;
  final List<dynamic> pastJobs;
  final int rateQuantity;
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
  final bool following;

  const Profile(
      {required this.isAdmin,
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
      required this.location});

  @override
  List<Object> get props => [
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
        location
      ];
}
