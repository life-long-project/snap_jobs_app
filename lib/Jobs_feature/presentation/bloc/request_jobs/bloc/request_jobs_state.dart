part of 'request_jobs_bloc.dart';

abstract class RequestJobsState extends Equatable {
  const RequestJobsState();

  @override
  List<Object> get props => [];
}

class RequestJobsInitial extends RequestJobsState {}

class RequestJobLoading extends RequestJobsState {}

class RequestJobLoaded extends RequestJobsState {
  final List<JobEntity> posts;

  const RequestJobLoaded({required this.posts});

  @override
  List<Object> get props => [posts];
}

class RequestJobError extends RequestJobsState {
  final String message;

  const RequestJobError({required this.message});

  @override
  List<Object> get props => [message];
}
