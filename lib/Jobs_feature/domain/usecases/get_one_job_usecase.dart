import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../repositories/jobs_repository.dart';

class GetOneJobUseCase {
  final JobsRepository repository;

  GetOneJobUseCase(this.repository);

  Future<Either<Failure, List>> call() async {
    return await repository.getAllJobs();
  }
}
