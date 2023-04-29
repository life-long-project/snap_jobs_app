import '../../domain/entities/job_find.dart';
import '../../domain/entities/jobs.dart';

//useless
class JobByNameModel extends JobSearch {
  const JobByNameModel(
      {required super.error,
      required super.search,
      required super.skills,
      required super.jobs});

  factory JobByNameModel.fromJson(Map<String, dynamic> json) => JobByNameModel(
        error: json['error'],
        //list of object
        jobs: List<Jobs>.from(json['jobs']),
        search: json['search'],
        skills: List<String>.from(json['skills']),
        //list of skills
      );
}
