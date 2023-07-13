

import 'package:equatable/equatable.dart';
import 'package:snap_jobs/profile_feature/domain/entities/user.dart';

// ignore: camel_case_types
class UserJobs extends Equatable{
  final String sId;
  final String postedById;
   final String jobName;
  final String jobDescription;
  final List<String>? jobSkills;
 final String? jobType;
 final String? jobLocation;
 final String? requiredExperience;
final  bool? isActive;
 final bool? isHidden;
 final bool? isReported;
 final String? salary;
 final String? jobDuration;
 final String? reportMessages;
 final bool? isFinished;
 final String? acceptedUserId;
 final List? jobImgUrl;
 final int? rating;
 final int? totalNrating;
 final String? createdAt;
 final String? updatedAt;
 final int? iV;
 final User? user;

  const UserJobs( this.sId, this.postedById, this.jobName, this.jobDescription, this.jobSkills, this.jobType, this.jobLocation, this.requiredExperience, this.isActive, this.isHidden, this.isReported, this.salary, this.jobDuration, this.reportMessages, this.isFinished, this.acceptedUserId, this.jobImgUrl, this.rating, this.totalNrating, this.createdAt, this.updatedAt, this.iV, this.user);




@override
List<Object?> get props => [sId, postedById, jobName, jobDescription, jobSkills, jobType, jobLocation, requiredExperience, isActive, isHidden, isReported, salary, jobDuration, reportMessages, isFinished, acceptedUserId, jobImgUrl, rating, totalNrating, createdAt, updatedAt, iV, user];
}