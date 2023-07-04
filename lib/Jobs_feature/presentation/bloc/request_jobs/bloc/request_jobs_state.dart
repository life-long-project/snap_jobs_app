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
      this.message = ""});

  final RequestJobsStatus requestJobsStatus;
  final List<JobEntity> jobs;
  final String message;

  @override
  List<Object> get props => [requestJobsStatus, jobs, message];

  RequestJobsState copyWith({
    RequestJobsStatus? status,
    List<JobEntity>? jobs,
    String? message,
  }) {
    return RequestJobsState(
      requestJobsStatus: status ?? requestJobsStatus,
      jobs: jobs ?? this.jobs,
      message: message ?? this.message,
    );
  }
}
