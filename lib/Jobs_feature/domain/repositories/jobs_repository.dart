import 'package:dartz/dartz.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/core/error/failure.dart';

abstract class JobsRepository {
  Future<Either<Failure, List<JobEntity>>> getAllJobs();
  Future<Either<Failure, JobEntity>> getOneJob(String jobId);
  Future<Either<Failure, Unit>> deleteJob(String jobId);
  Future<Either<Failure, Unit>> updateJob(JobEntity job);
  Future<Either<Failure, Unit>> addJob(JobEntity job);

  Future<Either<Failure, Unit>> finishJob(String jobId);

  Future<Either<Failure, List<JobEntity>>> getUserActiveJobs(String userId);
  Future<Either<Failure, List<JobEntity>>> getUserAcceptedJobs(String userId);

  Future<Either<Failure, String>> getUserPhoneNumber(String userId);
}
