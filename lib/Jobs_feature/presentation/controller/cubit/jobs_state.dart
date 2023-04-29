import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../../domain/entities/jobs.dart';

class JobsState extends Equatable {
  final List<Jobs> jobs;
  final RequestState getJobState;
  final String message;
  const JobsState({
    this.jobs = const [],
    this.getJobState = RequestState.loading,
    this.message = '',
  });

  JobsState copyWith(
          {List<Jobs>? jobs, RequestState? getJopState, String? message}) =>
      JobsState(
        jobs: jobs ?? this.jobs,
        getJobState: getJopState ?? this.getJobState,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [jobs, getJobState, message];
}
