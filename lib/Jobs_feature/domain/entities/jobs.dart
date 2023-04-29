import 'package:equatable/equatable.dart';

//entity to display
//get list of jobs
//http://back-ph2h.onrender.com/jobs/
class Jobs extends Equatable {
  final String sId;
  final String postedById;
  final String jobName;
  final String jobDescription;
  final List<String> jobSkills;
  final String jobType;
  final String jobLocation;
  final bool isActive;
  final bool isHidden;
  final String salary;
  final String jobDuration;
  final String jobImgUrl;
  final String createdAt;
  final String updatedAt;
  final int iV;

  const Jobs(
      {required this.sId,
      required this.postedById,
      required this.jobName,
      required this.jobDescription,
      required this.jobSkills,
      required this.jobType,
      required this.jobLocation,
      required this.isActive,
      required this.isHidden,
      required this.salary,
      required this.jobDuration,
      required this.jobImgUrl,
      required this.createdAt,
      required this.updatedAt,
      required this.iV});

  @override
  List<Object> get props => [
        sId,
        postedById,
        jobName,
        jobDescription,
        jobSkills,
        jobType,
        jobLocation,
        isActive,
        isHidden,
        salary,
        jobDuration,
        jobImgUrl,
        createdAt,
        updatedAt,
        iV
      ];
}
