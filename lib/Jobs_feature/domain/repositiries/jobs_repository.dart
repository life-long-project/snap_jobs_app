import 'package:dartz/dartz.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/post_job_entity.dart';
import 'package:snap_jobs/core/error/failure.dart';

abstract class JobsRepository {
  Future<Either<Failure, List<JobPost>>> getAllJobs();
  Future<Either<Failure, Unit>> deleteJob(String jobId);
  Future<Either<Failure, Unit>> updateJob(JobPost post);
  Future<Either<Failure, Unit>> addJob(JobPost post);
}
