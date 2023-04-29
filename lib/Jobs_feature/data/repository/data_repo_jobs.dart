//call datasource to run methode in last stage
import 'package:dartz/dartz.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failure.dart';
import '../../domain/entities/jobs.dart';
import '../../domain/repository/job_feature.dart';

import '../dataSource/get_jobs.dart';

class JobRepository extends BaseJobsRepository {
  final BaseDataSource baseDataSource;

  JobRepository(this.baseDataSource);

  @override
  Future<Either<Failure, List<Jobs>>> getAllJobs() async {
    final result = await baseDataSource.getAllJobs();
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Jobs>>> getJobsByName(String parameters) async {
    final result = await baseDataSource.getJobsByName(parameters);
    try {
      return right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
