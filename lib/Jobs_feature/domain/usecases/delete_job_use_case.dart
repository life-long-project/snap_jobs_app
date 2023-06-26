import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../repositories/jobs_repository.dart';

class DeleteJobUseCase {
  final JobsRepository repository;

  DeleteJobUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String jobId) async {
    return await repository.deleteJob(jobId);
  }
}