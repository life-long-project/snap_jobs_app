import 'package:dartz/dartz.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';

import '../../../core/error/failure.dart';
import '../repositories/jobs_repository.dart';

class GetOneJobUseCase {
  final JobsRepository repository;

  GetOneJobUseCase(this.repository);

  Future<Either<Failure, JobEntity>> call(String jobId) async {
    return await repository.getOneJob(jobId);
  }
}
