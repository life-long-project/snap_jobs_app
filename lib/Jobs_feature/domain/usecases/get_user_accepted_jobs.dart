import 'package:dartz/dartz.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';

import '../../../core/error/failure.dart';
import '../repositories/jobs_repository.dart';

class GetUserAcceptedJobsUseCase {
  final JobsRepository repository;

  GetUserAcceptedJobsUseCase(this.repository);

  Future<Either<Failure, List<JobEntity>>> call(String userId) async {
    return await repository.getUserAcceptedJobs(userId);
  }
}
