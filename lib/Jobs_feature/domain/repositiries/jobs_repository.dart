import 'package:dartz/dartz.dart';
import 'package:post_job/core/error/failure.dart';
import 'package:post_job/post_job_feature/domain/entities/post_job_entity.dart';


abstract class JobsRepository {
  Future<Either<Failure, List<JobPost>>> getAllJobs();
  Future<Either<Failure, Unit>> deleteJob(String jobId);
  Future<Either<Failure, Unit>> updateJob(JobPost post);
  Future<Either<Failure, Unit>> addJob(JobPost post);
}
