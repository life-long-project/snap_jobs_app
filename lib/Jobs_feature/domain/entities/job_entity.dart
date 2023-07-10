import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:snap_jobs/offers_feature/domain/entities/offer_entity.dart';

enum JobType { fullTime, partTime, service }

///user is the person requesting the job
///worker is the person who will do the job
class JobEntity extends Equatable {
  final String jobId;
  final String? userId;
  final DateTime dateTime;
  final String? userName;
  final List<OfferEntity>? offers;
  final String jobTitle;
  final String? workerId;
  final bool isFinished ;
  final bool isActive;
  final JobType jobType;
  final String jobDescription;
  final int salary;
  final List<String>? skills;
  final int? duration;
  final List<String?> image;

  const JobEntity({
    required this.dateTime,
    this.userId,
    this.offers,
    this.userName,
    required this.jobTitle,
    required this.jobDescription,
    required this.jobType,
    required this.salary,
    this.skills,
    this.isActive = true,
    required this.isFinished ,

    this.workerId,
    this.duration,
    required this.image,
    this.jobId = "0",
  });

  @override
  List<Object?> get props => [
        jobId,
        workerId,
        userId,
        userName,
        isActive,
        duration,
        isFinished,
        jobTitle,
        jobDescription,
        jobType,
        salary,
        image,
      ];
}
