import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../repositories/jobs_repository.dart';

class FinishJobUseCase {
  final JobsRepository repository;

  FinishJobUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String jobId) async {
    return await repository.finishJob(jobId);
  }
}
