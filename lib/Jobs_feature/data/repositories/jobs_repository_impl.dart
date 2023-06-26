import 'package:dartz/dartz.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';
import 'package:snap_jobs/core/error/failure.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/network_info.dart';
import '../../domain/repositories/jobs_repository.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/job_remote_data_source.dart';
import '../models/job_post_model.dart';

typedef DeleteOrUpdateOrAddJob = Future<Unit> Function();

class JobsRepositoryImpl extends JobsRepository {
  final JobRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final JobsLocalDataSource localDataSource;
  JobsRepositoryImpl(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> addJob(JobEntity job) async {
    final JobModel jobModel = JobModel(
      image: job.image,
      jobDescription: job.jobDescription,
      jobId: job.jobId,
      jobTitle: job.jobTitle,
      jobType: job.jobType,
      salary: job.salary,
    );

    return await _getMessage(() {
      return remoteDataSource.addJob(jobModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> deleteJob(String jobId) async {
    return await _getMessage(() {
      return remoteDataSource.deleteJob(jobId);
    });
  }

  @override
  Future<Either<Failure, Unit>> updateJob(JobEntity job) async {
    final JobModel jobModel = JobModel(
        jobTitle: job.jobTitle,
        image: job.image,
        jobDescription: job.jobDescription,
        jobId: job.jobId,
        jobType: job.jobType,
        salary: job.salary);

    return await _getMessage(() {
      return remoteDataSource.updateJob(jobModel);
    });
  }

  @override
  Future<Either<Failure, List<JobEntity>>> getAllJobs() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteJobs = await remoteDataSource.getAllJobs();
        localDataSource.cacheJobs(remoteJobs);
        return Right(remoteJobs);
      } on ServerException {
        return const Left(ServerFailure(""));
      }
    } else {
      try {
        final localJobs = await localDataSource.getCachedJobs();
        return Right(localJobs);
      } on EmptyCacheException {
        return const Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, JobEntity>> getOneJob(String jobId) async {

  final response= await remoteDataSource.getOneJob(jobId);
    return Right(response);


  }

  @override
  Future<Either<Failure, List<JobEntity>>> getUserJobs(String userId) {
    // TODO: implement getUserJobs
    throw UnimplementedError();
  }

  Future<Either<Failure, Unit>> _getMessage(
      DeleteOrUpdateOrAddJob deleteOrUpdateOrAddPost) async {
    if (await networkInfo.isConnected) {
      try {
        await deleteOrUpdateOrAddPost();
        return const Right(unit);
      } on ServerException {
        return const Left(ServerFailure(""));
      }
    } else {
      return const Left(OfflineFailure());
    }
  }
}
