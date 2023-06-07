import 'package:dartz/dartz.dart';
import 'package:post_job/post_job_feature/domain/entities/post_job_entity.dart';

import '../../../core/error/failure.dart';
import '../repositiries/jobs_repository.dart';

class GetAllJobsUseCase {
  final JobsRepository repository;

  GetAllJobsUseCase(this.repository);

  Future<Either<Failure, List>> call() async {
    return await repository.getAllJobs();
  }
}