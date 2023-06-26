import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../repositories/jobs_repository.dart';

class GetAllJobsUseCase {
  final JobsRepository repository;

  GetAllJobsUseCase(this.repository);

  Future<Either<Failure, List>> call() async {
    return await repository.getAllJobs();
  }
}