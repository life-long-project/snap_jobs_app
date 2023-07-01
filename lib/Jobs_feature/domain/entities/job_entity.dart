import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum JobType { fullTime, partTime, service }

class JobEntity extends Equatable {
  final String jobId;
  final String? userId;
  final String jobTitle;
  final String? workerId;
  final bool isActive;
  final JobType jobType;
  final String jobDescription;
  final int salary;
  final List<String>? skills;
  final int? duration;
  final Image? image;

  const JobEntity({
     this.userId,
    required this.jobTitle,
    required this.jobDescription,
    required this.jobType,
    required this.salary,
    this.skills,
    this.isActive = true,
    this.workerId,
    this.duration,
    this.image,
    this.jobId = "0",
  }) ;

  @override
  List<Object?> get props => [
        jobId,
        workerId,
        userId,
        isActive,
        duration,
        jobTitle,
        jobDescription,
        jobType,
        salary,
        image,
      ];
}
