import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(
      {required this.skills,
      this.feedBack,
      required this.pastJobs,
      this.rateQuantity,
      required this.rating,
      required this.userImageUrl,
      required this.workImageUrl,
      required this.sId,
      required this.userName,
      required this.bio,
      required this.age,
      required this.location});

  final List<String> skills;
  final List<String>? feedBack;
  final List<String> pastJobs;
  final double? rateQuantity;
  final double rating;
  final String userImageUrl;
  final String workImageUrl;

  final String sId;

  final String userName;
  final String bio;
  final int age;
  final String location;

  @override
  List<Object?> get props => [
        skills,
        feedBack,
        pastJobs,
        rateQuantity,
        rating,
        userImageUrl,
        workImageUrl,
        sId,
        userName,
        bio,
        age,
        location,
      ];
}
