part of 'post_job_bloc.dart';

abstract class AddDeleteUpdateJobsState extends Equatable {
  const AddDeleteUpdateJobsState();

  @override
  List<Object> get props => [];
}

class AddDeleteUpdateJobsInitial extends AddDeleteUpdateJobsState {}

class LoadingAddDeleteUpdateJobsState extends AddDeleteUpdateJobsState {}

class ErrorAddDeleteUpdateJobsState extends AddDeleteUpdateJobsState {
  final String message;

  ErrorAddDeleteUpdateJobsState({required this.message});

  @override
  List<Object> get props => [message];
}

class MessageAddDeleteUpdateJobsState extends AddDeleteUpdateJobsState {
  final String message;

  MessageAddDeleteUpdateJobsState({required this.message});

  @override
  List<Object> get props => [message];
}
