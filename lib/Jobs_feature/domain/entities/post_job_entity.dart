import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class JobPost extends Equatable {
  final String jobId;
  final String jobName;
  final String jobDescription;
  final String jobType;
  final int salary;
  final Image? image;
  

  const JobPost(
      {required this.jobId,
      required this.jobName,
      required this.jobDescription,
      required this.jobType,
      required this.salary,
      required this.image,
      });

  @override
  List<Object?> get props => [
        jobId,
        jobName,
        jobDescription,
        jobType,
        salary,
        image,
        
      ];
}
