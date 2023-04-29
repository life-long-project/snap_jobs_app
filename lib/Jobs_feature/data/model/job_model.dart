import '../../domain/entities/jobs.dart';

class JobsModel extends Jobs {
  const JobsModel({
    required super.sId,
    required super.postedById,
    required super.jobName,
    required super.jobDescription,
    required super.jobSkills,
    required super.jobType,
    required super.jobLocation,
    required super.isActive,
    required super.isHidden,
    required super.salary,
    required super.jobDuration,
    required super.jobImgUrl,
    required super.createdAt,
    required super.updatedAt,
    required super.iV,
  });

  factory JobsModel.fromJson(Map<String, dynamic> json) => JobsModel(
        sId: json['_id'] ?? '',
        postedById: json['posted_by_id'] ?? '',
        jobName: json['job_name'] ?? '',
        jobDescription: json['job_description'] ?? '',
        jobSkills: json['job_skills'].cast<String>() ?? '',
        jobType: json['job_type'] ?? '',
        jobLocation: json['job_location'] ?? '',
        isActive: json['is_active'] ?? '',
        isHidden: json['is_hidden'] ?? '',
        salary: json['salary'] ?? '',
        jobDuration: json['job_duration'] ?? '',
        jobImgUrl: json['job_img_url'] ?? '',
        createdAt: json['createdAt'] ?? '',
        updatedAt: json['updatedAt'] ?? '',
        iV: json['__v'] ?? '',
      );
}
