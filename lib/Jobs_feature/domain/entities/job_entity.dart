import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:snap_jobs/offers_feature/domain/entities/offer_entity.dart';

part 'job_entity.g.dart';

@HiveType(typeId: 2)
enum JobType {
  @HiveField(0)
  fullTime,
  @HiveField(1)
  partTime,
  @HiveField(2)
  service
}

///user is the person requesting the job
///worker is the person who will do the job

@HiveType(typeId: 1)
class JobEntity extends Equatable {
  @HiveField(0)
  final String jobId;

  @HiveField(2)
  final String? userId;
  @HiveField(3)
  final DateTime dateTime;
  @HiveField(4)
  final String? userName;
  @HiveField(5)
  final List<OfferEntity>? offers;
  @HiveField(6)
  final String jobTitle;
  @HiveField(7)
  final String? workerId;
  @HiveField(8)
  final bool? isAlreadyApplied;
  @HiveField(9)
  final bool isFinished;
  @HiveField(10)
  final int distance = Random().nextInt(100);
  @HiveField(11)
  final bool isActive;
  @HiveField(12)
  final JobType jobType;
  @HiveField(13)
  final String jobDescription;
  @HiveField(14)
  final int salary;
  @HiveField(15)
  final List<String>? skills;
  @HiveField(16)
  final int? duration;
  @HiveField(17)
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
