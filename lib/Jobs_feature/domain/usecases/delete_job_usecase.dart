import 'package:dartz/dartz.dart';
import 'package:post_job/post_job_feature/domain/entities/post_job_entity.dart';

import '../../../core/error/failure.dart';
import '../repositiries/jobs_repository.dart';

class DeleteJobUseCase {
  final JobsRepository repository;

  DeleteJobUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String jobId) async {
    return await repository.deleteJob(jobId);
  }
}