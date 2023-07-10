part of 'request_jobs_bloc.dart';

enum RequestJobsStatus {
  initial,

  loading,

  success,

  /// The form submission failed.
  failure,
}

final class RequestJobsState extends Equatable {
  const RequestJobsState(
      {this.requestJobsStatus = RequestJobsStatus.initial,
      this.jobs = const [],
      this.userActiveJobs = const [],

      this.message = ""});

  final RequestJobsStatus requestJobsStatus;
  final List<JobEntity> jobs;
  final List<JobEntity> userActiveJobs;
  final String message;

  @override
  List<Object> get props => [requestJobsStatus, jobs, message, userActiveJobs];

  RequestJobsState copyWith({
    RequestJobsStatus? status,
    List<JobEntity>? jobs,
    List<JobEntity>? userActiveJobs,
    String? message,

  }) {
    return RequestJobsState(
      requestJobsStatus: status ?? requestJobsStatus,
      jobs: jobs ?? this.jobs,
      userActiveJobs: userActiveJobs ?? this.userActiveJobs,
      message: message ?? this.message,
    );
  }
}
