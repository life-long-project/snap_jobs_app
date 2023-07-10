part of 'get_all_jobs_bloc.dart';

abstract class GetAllJobsState extends Equatable {
  const GetAllJobsState();
  
  @override
  List<Object> get props => [];
}

class GetAllJobsInitial extends GetAllJobsState {}
class LoadingJobsState extends GetAllJobsState {}

class LoadedJobsState extends GetAllJobsState {
  final List<JobPost> posts;

  const LoadedJobsState({required this.posts});

  @override
  List<Object> get props => [posts];
}

class ErrorPostJobsState extends GetAllJobsState {
  final String message;

  const ErrorPostJobsState({required this.message});

  @override
  List<Object> get props => [message];
}