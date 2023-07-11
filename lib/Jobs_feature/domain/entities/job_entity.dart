import 'dart:math';

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
  final bool? isAlreadyApplied;
  final bool isFinished;
  final int distance = Random().nextInt(100);
  final bool isActive;
  final JobType jobType;
  final String jobDescription;
  final int salary;
  final List<String>? skills;
  final int? duration;
  final List<String?> image;

  JobEntity({
    required this.dateTime,
    this.userId,
    this.isAlreadyApplied,
    this.offers,
    this.userName,
    required this.jobTitle,
    required this.jobDescription,
    required this.jobType,
    required this.salary,
    this.skills,
    this.isActive = true,
    required this.isFinished,
    this.workerId,
    this.duration,
    required this.image,
    this.jobId = "0",
  });
JobEntity copyWith({
    String? jobId,
    String? userId,
    DateTime? dateTime,
    String? userName,
    List<OfferEntity>? offers,
    String? jobTitle,
    String? workerId,
    bool? isAlreadyApplied,
    bool? isFinished,
    int? distance,
    bool? isActive,
    JobType? jobType,
    String? jobDescription,
    int? salary,
    List<String>? skills,
    int? duration,
    List<String?>? image,
  }) {
    return JobEntity(
      jobId: jobId ?? this.jobId,
      userId: userId ?? this.userId,
      dateTime: dateTime ?? this.dateTime,
      userName: userName ?? this.userName,
      offers: offers ?? this.offers,
      jobTitle: jobTitle ?? this.jobTitle,
      workerId: workerId ?? this.workerId,
      isAlreadyApplied: isAlreadyApplied ?? this.isAlreadyApplied,
      isFinished: isFinished ?? this.isFinished,
      isActive: isActive ?? this.isActive,
      jobType: jobType ?? this.jobType,
      jobDescription: jobDescription ?? this.jobDescription,
      salary: salary ?? this.salary,
      skills: skills ?? this.skills,
      duration: duration ?? this.duration,
      image: image ?? this.image,
    );
  }

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
