import 'package:dartz/dartz.dart';
import 'package:snap_jobs/Jobs_feature/domain/entities/post_job_entity.dart';

import '../../../core/error/failure.dart';
import '../repositiries/jobs_repository.dart';

class UpdateJobUseCase {
  final JobsRepository repository;

  UpdateJobUseCase(this.repository);

  Future<Either<Failure, Unit>> call(JobPost post) async {
    return await repository.updateJob(post);
  }
}
