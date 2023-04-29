import 'package:equatable/equatable.dart';

import 'package:dartz/dartz.dart';

import 'package:snap_jobs/core/error/failure.dart';

import '../entities/jobs.dart';
import '../repository/job_feature.dart';

class SearchJobUseCase {
  final BaseJobsRepository baseJobsReposotrey;

  SearchJobUseCase(this.baseJobsReposotrey);

  Future<Either<Failure, List<Jobs>>> searchJob(String parameters) async {
    return await baseJobsReposotrey.getJobsByName(parameters);
  }
}

class SearchNameParameter extends Equatable {
  final String name;

  const SearchNameParameter(this.name);

  @override
  List<Object?> get props => [name];
}
