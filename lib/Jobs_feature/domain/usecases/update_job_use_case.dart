import 'package:dartz/dartz.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/job_entity.dart';

import '../../../core/error/failure.dart';
import '../repositories/jobs_repository.dart';

class UpdateJobUseCase {
  final JobsRepository repository;

  UpdateJobUseCase(this.repository);

  Future<Either<Failure, Unit>> call(JobEntity post) async {
    return await repository.updateJob(post);
  }
}
