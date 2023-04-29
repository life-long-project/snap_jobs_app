// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/jobs.dart';
//import '../use case/search_use_case.dart';

abstract class BaseJobsRepository {
  Future<Either<Failure, List<Jobs>>> getAllJobs();
  Future<Either<Failure, List<Jobs>>> getJobsByName(String parameters);
}
